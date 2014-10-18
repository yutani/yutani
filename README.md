Yutani
================

Installation
-------------

```
cp config/example.database.yml config/database.yml
bundle install
configure postgresql role and login permissions
bundle exec rake db:create db:migrate
bundle exec rake db:migrate RAILS_ENV=test
rails generate rspec:install
bundle exec rspec
```