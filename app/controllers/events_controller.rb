class EventsController < ApplicationController
  def index
    redirect_to root_path
  end
  def show
    @event = Event.find(params[:id])
    if @event.enabled != true
      redirect_to root_path
    end
  end
end