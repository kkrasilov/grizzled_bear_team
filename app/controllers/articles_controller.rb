# frozen_string_literal: true

class ArticlesController < ApplicationController
  def about_team
    @team = JSON.parse(File.read("#{Rails.root}/public/team.json"))
  end
end
