class EventsController < ApplicationController
    def create
        @event = Event.new(:habit_id => params[:habit_id] , :date => params[:date] , :completed => true )
        if @event.save
          redirect_to @event.habit
        else
          render 'static_pages/home', status: :unprocessable_entity
        end
    end 

    private

    def event_params
        params.require(:event).permit(:habit_id, :date)
    end
end
