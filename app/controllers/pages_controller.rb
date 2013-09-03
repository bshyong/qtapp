class PagesController < ApplicationController
  def index
    @activities = current_user.try(:activities)
  end
end