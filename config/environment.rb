# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  require 'rubygems'
  config.time_zone = 'London'
  
  # added lines to test x-accell
  config.load_paths += %W( #{RAILS_ROOT}/lib/letters )
  # end
  
  config.gem "searchlogic"


  config.action_controller.session = {
    :session_key => '_admit_session',
    :secret      => 'f1761f6a6d88ba061a0db168f538360c0954a792c0c59b8b755cbda1d2210afe1ffe5b26c304fdcfc283cb37bc68988f57e24ec42f7d723133a56698fc810d1b'
  }

end
  
  CASClient::Frameworks::Rails::Filter.configure(
    :cas_base_url => "https://id.glam.ac.uk/cas"
  )