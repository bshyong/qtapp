class PagesController < ApplicationController
  def index
    @users = User.all
    @activities = current_user.activities
  end
end
