source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby
# Use Twitter Bootstrap
#gem 'twitter-bootstrap-rails', :git => 'http://github.com/seyhunak/twitter-bootstrap-rails', :branch => 'bootstrap3'
#gem 'twbs_sass_rails'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

group :test, :development do
  gem 'rspec-rails'
end

group :test do
  gem 'factory_girl_rails', :require => false #moved to load explicitly inside rails_spec because it screws up db:migrate by loading too soon if left here
  gem 'shoulda-matchers'
  gem 'database_cleaner'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Seperate seed data
gem 'seedbank'

# Authentication
gem 'sorcery'

# Auditng, Versioning, History
gem 'paper_trail', '~> 3.0.3'

#Activity stream
gem 'public_activity'

# Pagination
gem 'will_paginate'
gem 'will_paginate-bootstrap'

# For MTI
gem 'acts_as_relation'

# For Heroku
gem 'rails_12factor', group: :production

# Image upload and storage
gem 'carrierwave'
gem 'cloudinary'
