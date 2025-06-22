# frozen_string_literal: true
class CommentsController < ApplicationController
  def create
    @activity = Activity.find(params[:activity_id])
    @comment = @activity.comments.build(comment_params)

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @activity }
      end
    else
      
    end
  end

  private

  def comment_params
    params.permit(:body).merge(user_id: current_user.id)
  end
end
