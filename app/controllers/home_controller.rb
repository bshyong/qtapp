class HomeController < ApplicationController
  def index
    @users = User.all
    @activites = current_user.activities
  end
end
