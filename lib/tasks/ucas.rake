require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")


namespace :ucas do

desc "Prints out the time in the format we want"
task(:whenisnow => :environment) do
  @timestamp = Time.now.strftime('%Y%m%d%H%M%S')
  puts @timestamp
end





end

  
  
