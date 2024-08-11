
class EventsController < ApplicationController
  def create
    #todo handle api failure
    EventCreator.new(params).call
    redirect_to :events, notice: "Event created Successfully."
  end
end
