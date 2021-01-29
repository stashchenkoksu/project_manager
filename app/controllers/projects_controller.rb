class ProjectsController < ApplicationController
  load_and_authorize_resource

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project
    else
      render :new
    end
  end
  def show
    @project_teams = @project.teams.map{|team| team = team.name}
  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :summary, :start_date, :end_date)
  end
end


