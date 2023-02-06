class HabitsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy

  def create
    @habit = current_user.habits.build(habit_params)
    if @habit.save
      flash[:success] = "habit created!"
      redirect_to root_url
    else
      render 'static_pages/home', status: :unprocessable_entity
    end
  end

  def show
    @habit = Habit.find(params[:id])
    @events = @habit.events.order(date: :desc)
  end

  def destroy
    @habit.destroy
    flash[:success] = "habit deleted"
    if request.referrer.nil?
      redirect_to root_url, status: :see_other
    else
      redirect_to request.referrer, status: :see_other
    end
  end

  private

    def habit_params
      params.require(:habit).permit(:description,:name)
    end

    def correct_user
      @habit = current_user.habits.find_by(id: params[:id])
      redirect_to root_url, status: :see_other if @habit.nil?
    end
end
