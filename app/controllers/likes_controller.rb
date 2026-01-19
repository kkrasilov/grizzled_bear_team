# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @activity = Activity.find(params[:activity_id])
    @like = @activity.likes.find_by(user: current_user)

    @like.present? ? @like.destroy : @activity.likes.create(user: current_user)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end
end
