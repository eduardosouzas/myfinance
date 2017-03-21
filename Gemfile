source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Flexible authentication solution for Rails with Warden.
gem 'devise'
# Rails gem of the Bootstrap based admin theme SB Admin 2.
gem 'bootstrap_sb_admin_base_v2'
# i18n Devise
gem 'devise-i18n'
# Manage Procfile-based applications
gem 'foreman'

# Easy file attachment management for ActiveRecord
gem 'paperclip', '~> 5.0.0'

# A Ruby Gem that wraps the functionality of jQuery Raty library, and provides optional IMDB style rating.
gem 'ratyrate'

gem 'rails-i18n'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# FriendlyId is the “Swiss Army bulldozer” of slugging and permalink plugins for ActiveRecord. It allows you
#to create pretty URL’s and work with human-friendly strings as if they were numeric ids for ActiveRecord models.
gem 'friendly_id', '~> 5.1.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# jQuery UI for the Rails asset pipeline
gem 'jquery-ui-rails'
# pagination for rails
gem 'kaminari'
# integration of will_paginate with bootstrap
gem 'kaminari-i18n'
# Integration of RubyMoney - Money with Rails
gem 'money-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# The safe Markdown parser, reloaded.
gem 'redcarpet'
# Minimal authorization through OO design and pure Ruby classes
gem 'pundit'
# Help ActiveRecord::Enum feature to work fine with I18n and simple_form.
gem 'enum_help'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# If Turbolinks are not enough for you. Wiselinks makes your application work faster.
gem 'wiselinks'

source 'https://rails-assets.org'  do
  gem 'rails-assets-bootstrap', '3.3.7'
  # bootstrap notify
  gem 'rails-assets-bootstrap.growl'
  # animated css for bootstrap notify
  gem 'rails-assets-animate-css'
  gem 'rails-assets-bootbox'
  gem 'rails-assets-bootstrap-markdown'
  gem 'rails-assets-marked'
end
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Better error page for Rack apps
  gem "better_errors"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  #Generate Entity-Relationship Diagrams for Rails applications http://voormedia.github.io/rails-erd/
  gem 'rails-erd'
  # Catches mail and serves it through a dream.
  gem 'mailcatcher'

  gem 'pry-rails'
  # Markdown Lorem Ipsum generator
  gem 'doctor_ipsum'
  # Gerador de Lero-Lero.
  gem 'lerolero_generator'
  gem 'faker'
  gem 'capistrano', '~> 3.7'
  gem 'capistrano-bundler', '~> 1.2'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-rvm'
end

group :production do
  gem 'mysql2', '~> 0.3.18'
end
