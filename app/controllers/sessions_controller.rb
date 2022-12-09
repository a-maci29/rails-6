class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session
      log_in user
      redirect_to user

    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!

      render 'new'
    end
  end

  def current_user
    if session[:user_id]
      User.find_by[id: session[:user_id]]
      #### why `id: session[:user_id]` and not simply `session[:user_id]`?
    end

    if current_user.nil?
      @current_user ||= User.find_by(id: session[:user_id])
  end

  def destroy
  end
end
