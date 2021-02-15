# frozen_string_literal: true

class AdminPageController < ApplicationController
  # load_and_authorize_resource class:  AdminPageController
  def admin
    @users = User.all.paginate(page: params[:page], per_page: 15)
  end

  def project_page
    @projects = Project.all.paginate(page: params[:page], per_page: 10)
  end

  def user_statistic
    @user = User.find_by_id(params[:id])
    @amount_of_task = @user.tasks.count
    @complete_tasks = @user.tasks.where({ status: 'done' })
    @incomplete_tasks = @user.tasks.where({ status: ['in progress', 'not started', 'begin', '', nil] })
  end

  def project_statistic
    @project = Project.find_by_id(params[:id])
    @amount_of_task = @project.tasks.count
    @complete_tasks = @project.tasks.where({ status: 'done' })
    @incomplete_tasks = @project.tasks.where({ status: ['in progress', 'not started', 'begin', '', nil] })
  end
end
