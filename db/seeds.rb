# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(uname: 'SuperAdmin', password: 'admin', utype: 'admin')
Building.create(bname: 'D.H.Hill')
Building.create(bname: 'James.B.Hunt')
Room.create(rnumber: '101A', size: '4', status: 'available', building_id: 1)
Room.create(rnumber: '101B', size: '4', status: 'available', building_id: 2)