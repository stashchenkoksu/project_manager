class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tasks = User.find(params[:id]).tasks.paginate(page: params[:page], per_page: 5)
    # @tasks = @user.tasks.paginate
  end

  def profile
    @name = current_user.first_name
    @email = current_user.email
  end
end
