# frozen_string_literal: true

module Tasks
  class CommentsController < CommentsController
    before_action :set_commentable

    private

    def set_commentable
      @commentable = Task.find(params[:task_id])
    end
  end
end
