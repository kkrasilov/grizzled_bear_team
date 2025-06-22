# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  
  def index
    @users = User.all  
  end
  def show; end

  def edit
    authorize @user
  end

  def update
    authorize @user

    if current_user.update(user_params)
      redirect_to user_path(current_user), notice: I18n.t('notice.updated')
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :surname, :avatar, :gender)
  end

  def set_user
    @user = User.find_by(id: params[:id])
    redirect_to root_path, notice: I18n.t('notice.not_found') if @user.blank?
  end
end
