class HomeController < ApplicationController
  def index
    @users = User.all
    @activities = current_user.activities
  end
end
