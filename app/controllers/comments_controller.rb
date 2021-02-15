# frozen_string_literal: true

class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :find_commentable

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.username = current_user.first_name + ' ' + current_user.last_name
    @comment.user_id = current_user.id
    @comment.save
    if params[:comment_id]
      redirect_back(fallback_location: root_path)
    else
      redirect_to @commentable
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def find_commentable
    if params[:comment_id]
      @commentable = Comment.find_by_id(params[:comment_id])
    elsif params[:project_id]
      @commentable = Project.find_by_id(params[:project_id])
    elsif params[:task_id]
      @commentable = Task.find_by_id(params[:task_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
