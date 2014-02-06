source 'https://rubygems.org'

gem 'rails', '4.1.0.beta1'

# assets
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby
gem 'less-rails'
gem 'sass-rails', '~> 4.0.0.rc1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

# authentication
gem 'devise'

# blog
# gem 'acts-as-taggable-on', git: 'https://github.com/mbleigh/acts-as-taggable-on.git'
# gem 'ancestry'
# gem 'friendly_id', git: 'https://github.com/FriendlyId/friendly_id'
# gem 'rakismet'
gem 'redcarpet'
# gem 'will_paginate'
# gem 'will_paginate-bootstrap'

# charts
gem 'rickshaw-rails', git: 'https://github.com/jrmyward/rickshaw-rails.git', branch: 'master'

# cron
# gem 'whenever'

# database
gem 'pg'

# deployment
gem 'unicorn'

# image manipulation
# gem 'rmagick'
# gem 'carrierwave'

# javascript
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# mailchimp
# gem 'gibbon'

# payment
# gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
# gem 'stripe_event'

# querying
# gem "squeel"

# queque
# gem 'sidekiq'

# sitemap
# gem 'sitemap_generator'

# views
gem 'browser', :git => 'git://github.com/fnando/browser'
gem "font-awesome-rails", '~> 3.2.1.3'
gem 'haml'
gem 'haml-rails'
gem 'simple_form', :git => 'git://github.com/plataformatec/simple_form.git'

group :doc do
  # gem 'sdoc', require: false
  gem 'yard'
end

# Tools
gem 'pry'
gem 'pry-debugger'

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/jonleighton/spring
gem 'spring',        group: :development

group :development do
  gem 'bullet'
  # gem 'capistrano', '~> 3.1.0'
  # gem 'capistrano-rails',   '~> 1.1', require: false
  # gem 'capistrano-bundler', '~> 1.1', require: false
  # gem 'capistrano-rbenv', '~> 2.0', require: false
  gem 'guard-rspec', require: false
end

group :test, :development do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'rack-mini-profiler'
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'spork-rails'
end

group :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'fuubar', git: 'git@github.com:jrmyward/fuubar.git', branch: 'develop'
  gem 'guard-spork'
  gem 'minitest'
  gem 'poltergeist'
  gem 'shoulda-matchers'
  gem 'simplecov', '>=0.4.2', :require => false
  gem 'stripe-ruby-mock', '>= 1.8.7.4'
  gem 'timecop'
  gem 'turn', :require => false
  gem 'vcr'
  gem 'webmock'
end