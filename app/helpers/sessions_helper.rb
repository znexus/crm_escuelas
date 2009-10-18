module SessionsHelper

  def logged_in?
    if session[:user_id].blank?
      false
    else
      true
    end
  end

  def current_user
    User.find(session[:user_id]) 
  end

end
