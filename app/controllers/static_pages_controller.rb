class StaticPagesController < ApplicationController
  def home
    @habit = current_user.habits.build if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
