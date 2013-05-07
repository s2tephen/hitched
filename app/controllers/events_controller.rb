class EventsController < ApplicationController
  def index
   @events = Event.all
  end

  def show
    @events = Event.find(params[:id])
    @comments = @event.comments.paginate(page: params[:page])
    if @event.enabled != true
      redirect_to root_path
    end
  end

  def create
    @events = Event.create!(params[:event])
    redirect_to events_url
  end

  def update
    @events = Event.find(params[:id])
    @events.update_attributes!(params[:event])
    respond_to do |format|
      format.html { redirect_to events_url }
      format.js
    end
  end

  def destroy
    @events = Event.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to events_url }
      format.js
    end
  end
end