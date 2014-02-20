class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper :all # include all helpers, all the time
  
  helper_method :cas_logged_in?, :current_user
  
  def cas_logged_in?
    session[:cas_user] != nil
  end
  
  def current_user
    # @current_user ||= User.find_by_login(session[:cas_user])
    @current_user ||= "tcharris"
  end
  
  def valid_user?
    # User.find_by_login(session[:cas_user]) != nil
    return true
  end
  
  # include ActionView::Helpers::RawOutputHelper
    def fading_flash_message(text, seconds=3)
      raw text +
        <<-EOJS
          <script type='text/javascript'>
            document.observe('dom:loaded',function() {
              setTimeout(function() {
                message_id = $('flash_notice') ? 'flash_message' : 'flash_warning';
                new Effect.Fade(message_id);
              }, #{seconds*1000});
            }, false);
          </script>
        EOJS
    end
  
end
