################################################################################
# Generic Gemfile
# Updated according to:
#   - Michael Hartl 3-rd Edition (Listing 11.67)
#   - BKC standards (?)
#   - Heroku
#
#   NB! dont remove *coffee-rails* - *turbolinks* depends on it
#   28.06.2015  ZT
#   04.07.2015  pg_search
#   11.07.2015  acts-as-taggable-on
#   18.07.2015  no gems version selected
#               simple_form with bootstrap
#   17.09.2015	Ruby & RoR last versions
#   22.09.2015  gem *guard* added
#   24.11.2015  rails 4.2.5
#   14.01.2016  ruby 2.3.0
#   19.01.2016  Rails 5.0.0 Beta
#   20.01.2016  Turbolinks is OFF (waiting for TL 5)
#   03.02.2016  Rails 5.0.0.beta2
#   28.06.2016  Rails 5.0.0.rc2
#   07.07.2016  Ruby 2.3.1 & Rails 5.0.0
#               The file revision following the 5.0.0. version
#   10.10.2016  RoR 5.0.0.1
#   09.01.2017  Rails 5.0.1 / Ruby 2.4.0
#               (with json not OK for Ruby 2.4.0: line 'gem *sdoc*' is commented out for a while)
#   18.01.2017  Gems versions updated
#   07.02.2017  gem 'seed_dump' added
#   13.02.2017  gem 'react-rails' added
#   27.04.2017  Rails 5.0.2
#   22.05.2017  Ruby 2.4.1 / RoR 5.0.3
################################################################################
source 'https://rubygems.org'
ruby '2.4.1'
gem 'rails', '~> 5.1.3'                         # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

gem 'sqlite3'                                   # Use sqlite3    as the database for Active Record
#gem 'sqlite3', groups: [:test, :development]
#gem 'mysql2', '~> 0.4.4'                       # Use mysql      as the database for Active Record
#gem 'pg', '~> 0.19.0'                          # Use postgresql as the database for Active Record
#gem 'pg_search', '~> 2.0', '>= 2.0.1'          # https://mkdev.me/posts/kak-delat-full-text-poisk-v-rails-pri-pomoschi-postgresql
gem 'seed_dump'                                 # https://github.com/rroblak/seed_dump

gem 'sass-rails',   '~> 5.0'                    # Use SCSS for stylesheets
gem 'uglifier',     '>= 1.3.0'                  # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.2'                    # Use CoffeeScript for .coffee assets and views
gem 'react-rails'                               # https://rubygems.org/gems/react-rails/versions/1.7.1

#gem 'therubyracer', platforms: :ruby           # Call JavaScript code and manipulate JavaScript objects from Ruby.
                                                # Call Ruby code and manipulate Ruby objects from JavaScript.
                                                # https://github.com/rails/execjs

gem 'jquery-rails'                              # Use jquery as the JavaScript library
gem 'turbolinks', '~> 5'                        # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jbuilder'                                  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

gem 'puma'                                      # Use Puma as the app server

#gem 'sdoc', group: :doc                         # bundle exec rake doc:rails generates the API under doc/api.
gem 'bcrypt', '~> 3.1.7'                        # Use ActiveModel has_secure_password

gem 'haml-rails'                                # https://github.com/indirect/haml-rails

#gem 'devise'                                   # https://github.com/plataformatec/devise

gem 'pundit'                                    # https://github.com/elabs/pundit
gem 'ckeditor'                                  # https://github.com/galetahub/ckeditor
gem 'carrierwave',  '~> 1.1'                    # https://github.com/carrierwaveuploader/carrierwave
gem 'mini_magick'                               # https://github.com/minimagick/minimagick

gem "acts_as_list"                              # https://github.com/swanandp/acts_as_list
#gem 'acts-as-taggable-on'                      # https://github.com/mbleigh/acts-as-taggable-on

#gem 'redis'                                    # Use Redis adapter to run Action Cable in production

# MH 3-rd Edition
gem 'faker'
#gem 'fog'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'bootstrap-sass'

gem 'simple_form'                               # https://github.com/plataformatec/simple_form
gem 'enum_help'

group :development, :test do
  gem 'byebug'                      # Byebug is a Ruby 2 debugger. Call 'byebug' anywhere in the code to stop execution and get a debugger console
                                    # https://github.com/deivid-rodriguez/byebug
end

group :development do
  gem 'web-console'                 # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'listen'                      # https://github.com/guard/listen
  gem 'spring'                      # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen'       # Makes spring watch files using the listen gem.
end

group :test do
  gem 'minitest-reporters'
  gem 'mini_backtrace'
  gem 'guard'
  gem 'guard-minitest'
end

# Heroku
group :production do
  gem 'rails_12factor'
end

# gem 'unicorn'                                 # Use Unicorn as the app server
# gem 'capistrano-rails', group: :development   # Use Capistrano for deployment

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]   # Windows does not include zoneinfo files, so bundle the tzinfo-data gem