# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.6.0'

gem 'bootstrap-sass'
gem 'coffee-rails'     # Use CoffeeScript for .coffee assets and views
gem 'devise'
gem 'jbuilder'         # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jquery-rails'     # Use jquery as the JavaScript library
gem 'jwt'
gem 'puma'             # Use Puma as the app server
gem 'rails'            # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'sass-rails'       # Use SCSS for stylesheets
gem 'simple_command'
gem 'slim-rails'
gem 'turbolinks'       # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'uglifier'         # Use Uglifier as compressor for JavaScript assets

#gem 'castle-middleware', path: '../castle-ruby-middleware'
gem 'castle-middleware', git: 'https://github.com/wallin/castle-ruby-middleware.git', branch: 'upgrades'
gem 'dotenv-rails'

group :development, :test do
  gem 'byebug', platform: :mri  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
end

group :development do
  gem 'listen'
  gem 'pry-byebug'
  gem 'spring'                  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen'
  gem 'sqlite3'                 # Use sqlite3 as the database for Active Record
  gem 'web-console'             # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano3-puma',   require: false
  gem 'capistrano-dotenv-tasks', require: false
end

# always use: "bundle install --without production" command to install gems during development
group :production do
  gem 'thin'
  gem 'sqlite3'                 # Use sqlite3 as the database for Active Record
end

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# We're using 'bcrypt' that comes with devise
# gem 'bcrypt', '~> 3.1.7'        # Use ActiveModel has_secure_password
