class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tasks = User.find(params[:id]).tasks.paginate(page: params[:page], per_page: 5)
  end
end
