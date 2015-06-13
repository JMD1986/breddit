class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user != nil && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url = user.id
    else
      flash[:alert] = "Email or password did not match"
      render :new
    end #if
  end #create

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end #destroy
end #class
