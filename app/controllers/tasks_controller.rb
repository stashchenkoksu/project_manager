# frozen_string_literal: true

class TasksController < ApplicationController
  load_and_authorize_resource
  before_action :find_task, only: %i[show edit destroy update]
  before_action :find_project, only: %i[index new create]

  before_action :set_team_info, only: %i[new edit update create]

  def index
    @tasks = @project.tasks
  end

  def new
    @task = @project.tasks.new
  end

  def create
    @task = @project.tasks.new(task_params)

    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    pr_id = @task.project
    @task.destroy
    redirect_to project_tasks_path(pr_id)
  end

  def show
    @user_email = 'No user'
    unless @task.user_id.nil?
      user = User.find_by_id(@task.user_id)
      @user_email = user.first_name + ' ' + user.last_name + ' - ' + user.email
    end

    project = Project.find_by_id(@task.project_id)

    @project_name = project.name
  end

  def edit
    # code here
  end

  private

  def task_params
    params.require(:task).permit(:title,
                                 :content,
                                 :image,
                                 :start_date,
                                 :due_date,
                                 :estimation,
                                 :user_id,
                                 :status)
  end

  def set_team_info
    @team_users = []
    unless @task.project.nil?
      @task.project.teams.each { |team| @team_users += team.users }
      @team_users = @team_users.each_with_object([]) { |user, arr| arr << [user.email, user.id] }
    end
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
