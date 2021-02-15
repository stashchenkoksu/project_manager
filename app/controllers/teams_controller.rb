# frozen_string_literal: true

class TeamsController < ApplicationController
  load_and_authorize_resource
  before_action :set_team_info, only: %i[new edit update create]

  def index
    @teams = Team.all.paginate(page: params[:page], per_page: 10)
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team
    else
      render :new
    end
  end

  def update
    if @team.update(team_params)
      redirect_to @team
    else
      render :edit
    end
  end

  def show
    @team_members = @team.users.map { |user| user = user.first_name + ' ' + user.last_name + ' - ' + user.email }
    @team_projects = @team.projects.map { |project| project = project.name}
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_path
  end

  def edit; end

  def new; end

  private

  def team_params
    params.require(:team).permit(:name, user_ids: [], project_ids: [])
  end

  def set_team_info
    @users_email = User.all.each_with_object([]) { |user, arr| arr << [user.email, user.id] }
    @projects_name = Project.all.each_with_object([]) { |project, arr| arr << [project.name, project.id] }
  end
end
