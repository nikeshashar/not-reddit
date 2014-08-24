# Not Reddit
[![Code Climate](https://codeclimate.com/github/yoshdog/not-reddit/badges/gpa.svg)](https://codeclimate.com/github/yoshdog/not-reddit)
[![Code Climate](https://codeclimate.com/github/yoshdog/not-reddit/badges/gpa.svg)](https://codeclimate.com/github/yoshdog/not-reddit)

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

How to set it up
----
```sh
git clone git@github.com:yoshdog/not-reddit.git
cd not-reddit
bin/rake db:create
bin/rake db:migrate
bin/rake db:seed
```

How to run it
----
```sh
cd not-reddit
bin/rails s
```

open your browser and go to [localhost:3000](http://localhost:3000)

How to test it
----
```sh
cd not-reddit
rspec
```