source 'https://rubygems.org'

ruby '3.2.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1.5'

# Use sqlite3 as the database for Active Record
gem "sqlite3", ">= 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem 'jsbundling-rails'

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem 'cssbundling-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '>= 4.0.1'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows]
  gem 'rspec-rails', '~> 7.0.0'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  gem 'error_highlight', '>= 0.4.0', platforms: [:ruby]
  gem 'rubocop', '~> 1.7', require: false
  gem 'rubocop-capybara', '~> 2.21.0', require: false
  gem 'rubocop-performance', '~> 1.23.1', require: false
  gem 'rubocop-rails', '~> 2.28.0', require: false
  gem 'rubocop-rspec', '~> 3.3.0', require: false
  gem 'rubocop-rspec_rails', '~> 2.30.0', require: false
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
end

gem 'activestorage-validator'
gem 'blueprinter', '~> 0.25'
gem 'devise'
gem 'draper'
gem 'faker', '~> 3.5.1'
gem 'mini_magick', '~> 5.0.1'
gem 'pagy', '~> 9.3.3'
gem 'pundit', '~> 1.0'

gem 'propshaft', '~> 0.6'
gem 'turbo-rails', '~> 1.0'
