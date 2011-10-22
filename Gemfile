source 'http://rubygems.org'

gem 'rack', '1.3.3'
gem 'rails', '3.1.0'
# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg', :group => :production

gem 'json'
gem 'nifty-generators', :group => :development
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# using rspec default mocking library?
# gem "mocha", :group => :test

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  group :darwin do
    gem 'rb-fsevent', :require => false
    gem 'rb-inotify', :require => false
    gem 'rb-fchange', :require => false
  end
  gem 'spork', '> 0.9.0.rc'
  gem 'guard-rspec', :require => false
  gem 'guard-spork', :require => false
  gem 'growl'
  gem 'spork', '> 0.9.0.rc'
  gem 'cucumber-rails'  
  gem 'database_cleaner'
  gem 'webrat'
  gem 'capybara'
  gem 'factory_girl_rails'  
end
