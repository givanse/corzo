source 'https://rubygems.org'

ruby '2.1.1'

gem 'rails', '4.1.0'
gem 'sass-rails', '~> 4.0.3'

group :development, :test do
  # Use debugger
  gem 'columnize', '~> 0.3.6'
  gem 'debugger', group: [:development, :test]

  gem 'foreman'
end

group :test do
  gem 'rspec-rails', '2.13.1'
  gem 'spork-rails', '~> 4.0.0'
  gem 'selenium-webdriver', '~> 2.38.0'
  gem 'capybara', '~> 2.2.0'
end

group :production do
  # Include 'rails_12factor' gem to enable all platform features
  gem 'rails_12factor'
end

# Getting from the repo until 1.0.0 is released.
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'ransack'

# Needed this fix:
# https://github.com/svenfuchs/i18n/pull/229
gem 'i18n', github: 'svenfuchs/i18n'

# Use postgresql as the database for Active Record
gem 'pg', '0.15.1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. 
# Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'
gem 'devise'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

gem 'orm_adapter'
