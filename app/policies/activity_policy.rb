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
end
