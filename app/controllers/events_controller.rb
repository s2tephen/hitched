class EventsController < ApplicationController
  def index
   @event = Event.all
  end
  def show
    @event = Event.find(params[:id])
    @comments = @event.comments.paginate(page: params[:page])
    if @event.enabled != true
      redirect_to root_path
    end
  end


  def create
    @event = Event.create!(params[:event])
    redirect_to events_url
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes!(params[:event])
    respond_to do |format|
      format.html { redirect_to events_url }
      format.js
    end
  end

  def destroy
    @event = Event.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to events_url }
      format.js
    end
  end
end