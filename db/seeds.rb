# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Post.destroy_all
Comment.destroy_all

users = []
post_titles = %w{Nandos JayZ England Poker Australia BBC}
urls = ['', '', 'http://nandos.co.uk', 'http://google.com', 'http://bbc.co.uk']
statements = ['', '', 'Hipstas are taking over', 'Today is cray cray!']

users << User.create(username: 'bobgithub', email: 'bob@github.com', password: '12345678', password_confirmation: '12345678')
users << User.create(username: 'annagithub', email: 'anna@github.com', password: '12345678', password_confirmation: '12345678')
users << User.create(username: 'miahi', email: 'miahi@github.com', password: '12345678', password_confirmation: '12345678')

10.times do 
  user = users.sample
  Post.create(title: post_titles.sample, url: urls.sample, user_id: users.sample.id, text: statements.sample)
end