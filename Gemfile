source 'https://rubygems.org'

ruby '2.5.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.rc2', '< 5.1'

group :production do
  gem 'pg'                            # Postgres database on heroku
  gem 'rails_12factor'                # Required for assets pipeline on heroku
end

group :development do
  gem 'web-console', '~> 2.0'
end

group :development, :test do
  gem 'sqlite3', '~> 1.3', '< 1.4'
  gem 'rspec-rails', '~> 3.0'
  gem 'nyan-cat-formatter'
  gem 'pry-rails'
  gem 'shoulda'
  gem 'dotenv-rails'
  gem 'byebug'
  gem 'spring'
  gem 'factory_bot_rails'
end


gem 'bcrypt'                            # Use for encrypting user passwords
gem 'sass-rails', '~> 5.0'              # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'              # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.1.0'          # Use CoffeeScript for .coffee assets and views
gem 'jquery-rails'                      # Use jquery as the JavaScript library
gem 'jquery-ui-rails'                   # Use jquery UI library
gem 'turbolinks'                        # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'bootstrap-sass'                    # Bootstrap for style
gem 'faker'                             # Faker for seeding and tests
gem 'intercom-rails'                    # Intercom
gem 'devise'                            # Devise for authentication
gem 'pry'                               # Alternate Rails Console
gem 'groupdate'                         # https://github.com/ankane/groupdate ( requires postgresql / mysql )