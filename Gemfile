source 'https://rubygems.org'

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2'
gem 'sassc'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# Adding security
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'devise'
gem 'pundit'
# gem "administrate"
gem 'nokogiri' # required for minitest-have_tag
gem 'pg'

gem 'simple_form'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug'
  gem 'haml'
  gem 'haml-rails'
  gem "minitest", "5.10.3"
  gem 'guard' # NOTE: this is necessary in newer versions
  gem 'guard-minitest'
  gem 'factory_bot'
  gem 'factory_bot_rails'
  gem 'ffaker'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

