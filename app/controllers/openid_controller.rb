class OpenidController < ApplicationController
  include OpenIdAuthentication

  def login
    return unless request.post?
    
    status = begin_openid_authentication(params[:openid_url], open_id_path(:continue))
    
    flash[:error] = case status 
        when :missing : 'Sorry, the OpenID is missing.'
        when :failed  : 'Sorry, the OpenID verification failed.'
        when :timeout : 'Timed out.'
        when :unknown : 'Not sure what happened.'
      end
  end
  
  def continue
    status = complete_openid_authentication
    
    case status 
    when :missing   : failed_login('Sorry, the OpenID server couldn\'t be found.')
    when :canceled  : failed_login('OpenID verification was canceled.')
    when :failed    : failed_login('Sorry, the OpenID verification failed.')
    when :unknown   : failed_login('Not sure what happened.')
    when :success
      # Handle User lookup or creation here...
      # openid_result is a attr_reader for { :identity_url => String, :info => Hash }
      render(:text => "okay! #{openid_result[:identity_url]} + #{openid_result[:info]}")
    end
  end

private

  def failed_login(message)
    flash[:error] = message
    redirect_to(open_id_path(:login))
  end
  
end