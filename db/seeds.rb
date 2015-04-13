# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
unless User.exists?(email: "sslupinos@gmail.com") 
	User.create(email: "sslupinos@gmail.com", password: "main_chain", firstname: "Сергей", lastname: "Лc", confirmed_at: DateTime.now, confirmation_token: "", confirmation_sent_at: DateTime.now)
end