# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  include AuthenticatedSystem
  include RoleRequirementSystem
  include ExceptionNotifiable
  helper :all # include all helpers, all the time
  
  protect_from_forgery # :secret => '38eaf54b6cbcb6985db2c7a050952491'
  
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
  
  # Sorting
  
  # # A normal use case in a controller
  # @projects = Project.find(:all, :order => sort_order('created_at'))
  #  
  # # A case with associations and multiple columns
  # @requirements = requirements.find(:all, :include => [:product], :order => sort_order('denied, approved, requested'))
  #  
  # # A normal use case in a view
  # <%= sort_link 'Project', :name %>
  #  
  # # A case with associations and multiple columns
  # <%= sort_link 'Product : Version', 'products.name, products.version' %>
  
  def sort_order(default) 
    sql_order = []    
    sort_array = (params[:c] || default.to_s).gsub(/[\s;'\"]/,'').split(/,/)
    
    sort_array.each do |c|
      sql_order << c + " #{params[:d] == 'down' ? 'DESC' : 'ASC'}"
    end
    
    sql_order.join(', ')
  end  
  
   def find_actionable  
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end   
    
  def x_accel_pdf(path, filename)
    x_accel_redirect(path, :type => "application/pdf", :filename => filename)
  end

  def x_accel_redirect(path, opts ={})
    if opts[:type]
      response.headers['Content-Type'] = opts[:type]
    else
      response.headers['Content-Type'] = "application/octet-stream"
    end
    response.headers['Content-Disposition'] = "attachment;"
    if opts[:filename]
      response.headers['Content-Disposition'] << " filename= \"#{opts[:filename]}\""
    end
    response.headers["X-Accel-Redirect"] = path

    Rails.logger.info "#{path} sent to client using X-Accel-Redirect"
    render :nothing => true
  end
  
  
end
