class TasksController < ApplicationController
  load_and_authorize_resource
  before_action :find_project, only: [:index, :new, :create]
  before_action :find_task, only: [:show, :edit, :destroy, :update]

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

  private

  def task_params
    params.require(:task).permit(:title,
                                    :content,
                                    :image,
                                    :start_date,
                                    :due_date,
                                    :estimation,
                                    :user_id,
                                    :status
    )
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
