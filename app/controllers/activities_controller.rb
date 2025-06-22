# frozen_string_literal: true

class ActivitiesController < ApplicationController
  def index
    return redirect_to welcome_index_path unless current_user.present?

    @activities = policy_scope(Activity)
  end

  def new
    authorize Activity.new
  end

  def create
    authorize Activity.new

    @activity = current_user.activities.new(activity_params)

    if @activity.save
      flash[:notice] = I18n.t('notice.updated')
      redirect_to root_path
    else
      flash[:error] = @activity.errors.full_messages
      render :new
    end
  end

  def like
    @activity = Activity.find(params[:id])

    like = @activity.likes.find_by(user: current_user)

    if like.present?
      like.destroy
    else
      @activity.likes.create(user: current_user)
    end

    @activity.broadcast_replace_to(
      [current_user, @activity],
      target: "activity_#{@activity.id}_likes",
      locals: { user: current_user, message: @activity }
    )

    @activity.broadcast_replace_to(
      @activity,
      target: "activity_#{@activity.id}_likes_count",
      locals: { user: current_user, message: @activity })
  end

  private

  def activity_params
    activity_params = params.require(:activity)
          .permit(:distance, :duration_hours, :duration_minutes, :duration_seconds, :elevation, :category, :title,
            :start_time, :description, :ride_type)

    activity_params.merge(duration_seconds: 0) if activity_params[:duration_seconds].blank?
    activity_params
  end
end
