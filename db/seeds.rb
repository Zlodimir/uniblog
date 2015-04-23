# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#if User.exists?(email: "sslupinos@gmail.com") 
	#u = User.where(email: "sslupinos@gmail.com").first
	#u.destroy
#end

unless User.exists?(email: "sslupinos@gmail.com")
	User.create(email: "sslupinos@gmail.com", password: "123456789", firstname: "Сергей", lastname: "Лc",
		confirmed_at: DateTime.now, confirmation_token: "", confirmation_sent_at: DateTime.now, admin: true)
end

#u = User.where(email: 'sslupinos@gmail.com').first

#100.times do |num|
#	title = 'Title of the news № ' + num.to_s
#	if not Item.exists?(title: title)
#		Item.create(title: title, description: 'description of the news ' + num.to_s, author: u)
#	end
#end

unless Page.exists?(primary: :true)
	Page.create(name: 'Главная', content: 'содержание главной страницы', sort: 1, primary: true);
end