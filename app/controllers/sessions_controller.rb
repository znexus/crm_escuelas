#---
# Excerpted from "Advanced Rails Recipes",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/fr_arr for more book information.
#---
class SessionsController < ApplicationController

  
  skip_before_filter :login_required
  
  

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Bienvenid@ de vuelta, #{user.nombre}!"
      redirect_to "/"
    else
      flash[:error] = "Invalid email/password combination!"
      render :action => :new
    end
  end



  def destroy
    reset_session
    flash[:notice] = "You've been logged out."
    redirect_to new_session_url
  end


end

