class UsersController < ApplicationController
  def show
    @user = User.find([:id])
  end

  def new
  end
end
