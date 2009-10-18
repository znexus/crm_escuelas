# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  audit User, Institucion, Familia, Persona, Address, Relacion, Tag
  
  layout "layout"
  helper :all # include all helpers, all the time
  before_filter :login_required
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '3451370ef0f9024e4a5482395d357e6b'


#  def rescue_action_in_public(exception)
#    render :text => "<html><body><p>
#There was a global error processing your request.</p>
#<!--  #{exception}  --></body></html>"
#  end
#
#  def local_request?
#    false
#  end

  def login_required
    unless session[:user_id]
      flash[:notice] = "Please log in"
      redirect_to new_session_url
    end
  end
  
  def current_user
    User.find(session[:user_id]) 
  end

  protected

    class << self
    
      attr_reader :parents
    
      def parent_resources(*parents)
        @parents = parents
      end
    
    end

    def parent_id(parent)
      request.path_parameters["#{ parent }_id"]
    end

    def parent_type
      self.class.parents.detect { |parent| parent_id(parent) }
    end
    
    def parent_class
      parent_type && parent_type.to_s.singularize.classify.constantize
    end
     
    def parent_object
      parent_class && parent_class.find_by_id(parent_id(parent_type))
    end

end
