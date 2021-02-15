class UsersController < ApplicationController
  def index
    @users = User.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find(params[:id])
    @projects = @user.tasks.each_with_object([]) { |task, projects| projects << task.project_id }.uniq!
    @projects << 'all projects'
    @tasks = TasksFilter.call(user: @user, params: params, tasks: @tasks)
  end

end
