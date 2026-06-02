# frozen_string_literal: true

class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.sorted
    end
  end

  def new?
    @user.present?
  end

  def show?
    admin? || member?
  end

  def create?
    @user.present?
  end

  def edit?
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    @user.present? && @record.user_id == @user.id
  end
end
