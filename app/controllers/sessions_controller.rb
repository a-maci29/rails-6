class SessionsControler < ApplicationController

def new
end

def create
  user = User.find_by(email: params[:session][:email].downcast)
  if user && user.authentication(params[:session][:password])
  else
    render 'new'
  end
end

def destroy
end
