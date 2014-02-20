source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~>4.0.0'

#for login/authentication (replaces plugin)
gem "rubycas-client", "~> 2.3.10.rc1"

# Use smysql2 as the database for Active Record
gem 'mysql2'

group :development do
  gem 'capistrano', '~>2.12.0'
  gem 'capistrano-ext', '~>1.2.1'
  gem 'rvm-capistrano', '~> 1.2.7'    
end

# for oracle database connectivity
gem 'ruby-oci8', '~>2.1.4'
gem 'activerecord-oracle_enhanced-adapter', git: 'https://github.com/rsim/oracle-enhanced.git', branch: 'rails4'

# for authentication of Newport students
gem 'net-ldap'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# replacing ERB with HAML
gem 'haml', '~> 3.1.4'

gem 'passenger', '~> 4.0.19' 

# for pdf creation
gem 'prawn', '~>0.12.0' # use to encrypt and secure the pdf files from editing or copying
# gem 'pdfkit', '0.4.6' #problem with rendering all pages as pdf in 0.5.0
gem 'pdfkit', '~>0.5.4'

# delay pdf creation and emailing so that pdkfit and prawn don't slow down the site
gem 'delayed_job', '~>4.0.0'
gem 'delayed_job_active_record'
gem 'daemons'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

#fast bulk import of records using activerecord hopefully!
gem 'crewait'  

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
