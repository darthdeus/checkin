source 'http://rubygems.org'

gem 'rack', '1.3.3'
gem 'rails', '3.1.0'
gem 'json'
gem 'jquery-rails'
gem 'pg', :group => :production

group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end


gem 'nifty-generators', :group => :development

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  group :darwin do
    gem 'rb-fsevent', :require => false
    gem 'rb-inotify', :require => false
    gem 'rb-fchange', :require => false
  end
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
