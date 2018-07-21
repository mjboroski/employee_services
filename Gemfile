source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'active_model_serializers'
gem 'responders'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'thin'
gem 'omniauth'
gem 'omniauth-oauth2'
gem 'dotenv-rails'
gem 'omniauth-github', '~> 1.3'
gem 'rails', '~> 5.1.4'
gem 'sqlite3', git: "https://github.com/larskanis/sqlite3-ruby", branch: "add-gemspec"
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap-sass', '3.3.7'
gem 'coffee-rails', '~> 4.2.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'rspec'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
gem 'pry'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem "database_cleaner"
  gem "rspec-rails"
  gem "rack_session_access"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
