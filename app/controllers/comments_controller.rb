class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_commentable

  def create
    @comment = @commentable.comments.new comment_params
    @comment.username = current_user.first_name + " " + current_user.last_name
    @comment.save
    if params[:comment_id]
      redirect_back(fallback_location: root_path)
    else
      redirect_to @commentable
    end


  end

  def new
    @comment = Comment.new
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end


  private

  def find_commentable
    if params[:comment_id]
      @commentable = Comment.find_by_id(params[:comment_id])
    elsif params[:project_id]
      @commentable = Project.find_by_id(params[:post_id])
    elsif params[:task_id]
      @commentable = Task.find_by_id(params[:task_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:parent_id, :body)
  end
end

