source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.6'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'font-awesome-rails'
gem 'bcrypt', '~> 3.1.7'
gem 'attr_encrypted'
gem 'mailgun'
gem 'figaro'
gem 'httparty'
gem 'aws-sdk'
gem 'kaminari'
gem 'premailer-rails'
gem 'sidekiq'
gem 'sidekiq-unique-jobs'
gem 'stripe'
gem 'oauth'
gem 'whenever', :require => false
gem 'paper_trail'
gem "sentry-raven"
gem 'mailboxer'
gem 'local_time'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'listen'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
