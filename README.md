# /not/reddit
[![Code Climate](https://codeclimate.com/github/yoshdog/not-reddit/badges/gpa.svg)](https://codeclimate.com/github/yoshdog/not-reddit)
[![Test Coverage](https://codeclimate.com/github/yoshdog/not-reddit/badges/coverage.svg)](https://codeclimate.com/github/yoshdog/not-reddit)

## Features Implemented
* Users can sign up and login with their username
* Users can submit a link post
* Users can submit a text post
* Users can comment on posts
* Users can up and down vote posts 
* Users only has one vote per post
* Users can change their vote from up to down and vice versa
* Post displays the voting score

## Missing Features
* Display posts that are hot
* Display posts that are new
* Display posts that are rising
* Display posts that are top
* Display posts that are controversial
* Users can edit their posts
* Users can delete their posts
* Users can edit their comments
* Users can delete their comments
* User page displays user's posts and comments
* User can reply to comments
* User can up and down vote comments and replies
* Comments are ordered by score

## Deployed
Check it out on [Heroku](http://not-reddit.herokuapp.com/)

## Tech Stack
* Ruby 2.1.2
* Rails 4.1.4
* Postgresql
* Devise

## Testing Suite
### Unit Testing
* RSpec 3.0.3
* RSpec Collection Matchers

### Integration Testing
* Capybara
* Poltergeist
* Database Cleaner

### How to set it up
```sh
git clone git@github.com:yoshdog/not-reddit.git
cd not-reddit
bin/rake db:create
bin/rake db:migrate
bin/rake db:seed
```

### How to run it
```sh
cd not-reddit
bin/rails s
```

open your browser and go to [localhost:3000](http://localhost:3000)

### How to test it
```sh
cd not-reddit
rspec
```