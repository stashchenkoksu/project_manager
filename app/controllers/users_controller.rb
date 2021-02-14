class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @tasks = @user.tasks.where(["title LIKE?", "%#{params[:search]}%"]).paginate(page: params[:page], per_page: 5)
    @projects = []
    @tasks.each{|task| @projects << task.project_id}
    @projects.uniq!
  end

end
