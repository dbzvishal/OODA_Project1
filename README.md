# README

Library Room Booking Web App
============================================
App that simulates a room booking web application where users can reserve rooms 
for a specific time period from the list of available rooms.

Users can signup using their email id and password, view the list of available rooms,
search the list of rooms by room number, size or building name.
Based on their preferences, user can reserve a room which will appear in his/her
Booking History.

Administrators can manage rooms, manage the user details and manage the bookings of other users.

* Version : Ruby 2.2.4 and Rails 5.0

* System dependencies : Windows and Linux Systems

* Deployment instructions

    The App has been deployed on Heroku 
    accessible from the below link-

https://ooda-library-proj.herokuapp.com/

* Administrator Credentials

    Username: SuperAdmin

    Password: admin
    
    P.S. DO NOT CHANGE THE ADMIN CREDENTIALS, this will be of inconvenience to other reviewers of this project.
         If you are considering to change it, please replace it by the original value after your testing.
         
Information for Admins
===================================================================
If you log in as a normal admin, you have the following features

1. Create new admins (First you need to sign up the user and then use an admin to search the email and grant the upgrade process.)
2. View the list of all admins and their profile details (except password);
3. Delete admins (except herself/himself and the preconfigured Admin);
4. Manage rooms. Including add room, view lists of all rooms, view details of a room, edit the details of a room, view booking story of a room and delete a room from system.
5. Manage library members. Including view list of library members and profile details, view the reservation history of a library    member, and delete a library member.
6. The admin can cancel users' bookings by selecting the user or the concerned room.
         

Additional Information for the Users
===================================================================
1. For first time users, press REGISTER and sign up using an username, email-id and a password in the first login page.
2. For returning users, sign in with your chosen username and password.
3. The user will have the option of Booking a room, view his Booking History and Edit his/her profile.
4. Booking can be done in two hour slots only from the existing rooms according to a timeslot of your choice.
5. Click on the Room to see the timeslots the room is booked.
6. A user can search the rooms based on building, size, status(available or booked) and Room number.
7. When booking is done, the user can logout from the application.

Bonus Features
=============================================
1. A user can add team members by knowing their usernames beforehand.
   Once a user has been added to the team, a notification in the form of popup appears 
   which confirms the user has been added to the team.
   
   Other invited members can go to Bookings and can check the booking for your team.
   
2. A library user can only make one reservation in a particular date and time. Only after the booking is released/ reservation is cancelled, the user can proceed to make another booking.

However the Admin has been given the privileges to book multiple rooms on behalf of the user at a particular data and time.

For any other details: 

Contact:

Vishal, vmuruga@ncsu.edu

Ashima, asingh26@ncsu.edu

Spondon, skundu@ncsu.edu

