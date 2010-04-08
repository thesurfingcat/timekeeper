# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  
  before_filter CASClient::Frameworks::Rails::Filter, :except => [:new]
  
  include AuthenticatedSystem
    
  def new

  end

  def show
    
     if cas_logged_in?
         username = session[:cas_user]
         user = User.authenticate(username)
     
         if user
           self.current_user = user # logged in
           redirect_back_or_default(dashboard_path)
         end
       end
    end

          
  def index
    if valid_user?  
       redirect_to('/timelogs')
     else
       redirect_to('/invalidusers')
    end  
  end

  def destroy 
    #Kills CAS and restfull_auth session
    logged_in = false
    logout_killing_session!
    reset_session
        
    CASClient::Frameworks::Rails::Filter.logout(self)
    @current_user = false # not logged in, and don't do it for me
    session[:user_id] = nil
    
  end
  
protected
  # Track failed login attempts
  def note_failed_signin
    flash[:error] = "Couldn't log you in as '#{params[:login]}'"
    logger.warn "Failed login for '#{params[:login]}' from #{request.remote_ip} at #{Time.now.utc}"
  end
  
end