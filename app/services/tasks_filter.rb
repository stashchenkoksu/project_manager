class TasksFilter < ApplicationService
  def initialize(tasks:, params:, user:)
    @tasks = tasks
    @params = params
    @user = user
  end

  def call
    if @params[:search]
      @user.tasks.where(["title LIKE?", "%#{@params[:search]}%"])
    elsif @params[:filter_option]
      @params[:filter_option] == 'all projects' ? @user.tasks : @user.tasks.where(project_id: @params[:filter_option])
    else
      @user.tasks
    end.paginate(page: @params[:page], per_page: 10)
  end
end