User.destroy_all
Post.destroy_all
Comment.destroy_all

users = []
posts = []

post_titles = %w{Nandos JayZ England Poker Australia BBC}
urls = [nil, nil, 'http://nandos.co.uk', 'http://google.com', 'http://bbc.co.uk']
statements = ['', '', 'Hipstas are taking over', 'Today is cray cray!', '5 Circle sold for 1 billion dollars!']
comments = ['Worst post ever!', 'Wow this is a really useful link', 'Lol, so so lame', 'The UK governement will ban your posts', 'Watch out for the NSA', 'I like your thinking', 'Swaggy #yolo']
votes = [1, -1]

puts "*** Creating Users ***"
users << User.create(username: 'bobgithub', email: 'bob@github.com', password: '12345678', password_confirmation: '12345678')
users << User.create(username: 'anna', email: 'anna@github.com', password: '12345678', password_confirmation: '12345678')
users << User.create(username: 'Miahi', email: 'miahi@github.com', password: '12345678', password_confirmation: '12345678')
users << User.create(username: 'ecomba', email: 'ecoma@github.com', password: '12345678', password_confirmation: '12345678')
users << User.create(username: 'alexmakers', email: 'alexmakers@github.com', password: '12345678', password_confirmation: '12345678')
users << User.create(username: 'stephen', email: 'stephen@github.com', password: '12345678', password_confirmation: '12345678')
users << User.create(username: 'roidriscoll', email: 'roidriscoll@github.com', password: '12345678', password_confirmation: '12345678')

puts "*** Creating Posts ***"
25.times do 
  user = users.sample
  posts << Post.create(title: post_titles.sample, url: urls.sample, user_id: users.sample.id, text: statements.sample)
end

puts "*** Creating Comments ***"
100.times do
  Comment.create(body: comments.sample, post_id: posts.sample.id, user_id: users.sample.id)
end

puts "*** Creating Votes ***"
200.times do
  Vote.create(value: votes.sample, post_id: posts.sample.id, user_id: users.sample.id)
end
