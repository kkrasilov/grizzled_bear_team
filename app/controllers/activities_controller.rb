# frozen_string_literal: true

class ActivitiesController < ApplicationController
  def index
    return redirect_to welcome_index_path unless current_user.present?
  end
  
  def create
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
end
