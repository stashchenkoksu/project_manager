class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def profile
    @name = current_user.first_name
    @email = current_user.email
  end
end
