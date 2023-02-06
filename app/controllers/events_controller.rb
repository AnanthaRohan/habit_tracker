class EventsController < ApplicationController
    def create
        @event = Event.new(event_params)
        if @event.save
          redirect_to @event.habit
        else
          render 'new'
        end
    end 

    private

    def event_params
        params.require(:event).permit(:habit_id, :date)
    end
end
