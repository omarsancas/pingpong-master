class HomeController < ApplicationController
  helper_method :current_user
  def index
  end

  def history
  end

  def log
    @game = Game.new
    @opponents = User.where("id != ?", current_user.id)
  end
end
