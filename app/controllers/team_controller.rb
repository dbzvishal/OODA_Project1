class TeamController < ApplicationController

  def new
    @team = Team.new
    @team_names = Team.all.collect { |x| [x.name, x.id] }
  end

  def create
    name = params['uname']
    chosen_team_id = params['team']['id']=='' ? nil : params['team']['id']
    new_team_name = params['team']['name']=='' ? nil : params['team']['name']

    # Adding new user to old team
    unless chosen_team_id.nil?
      @team = Team.find(chosen_team_id)
      if User.does_user_exist? name
        user = User.get_user name
        if user.is_user_in_team? chosen_team_id
          redirect_to add_team_path, alert: 'User is already in the team'
          return
        end
        @team.users << user
        unless @team.save
          redirect_to add_team_path, alert: 'Error occurred while saving data'
          return
        end
      else
        redirect_to add_team_path, alert: 'User does not exist.'
        return
      end
    else
      # Adding new user to new team after creating new team.
      unless User.does_user_exist? name
        redirect_to add_team_path, alert: 'User does not exist.'
        return
      else
        @team = Team.create
        @team.name = new_team_name
        @team.save
        user = User.get_user name
        @team.users << user
        unless @team.save
          redirect_to add_team_path, alert: 'Error occurred while saving data'
          return
        end
      end
    end

    new
    render add_team_path
  end
end