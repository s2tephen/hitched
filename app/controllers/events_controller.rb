class EventsController < ApplicationController
  def index
    redirect_to root_path
  end
  def show
    @event = Event.find(params[:id])
    @comments = @event.comments.paginate(page: params[:page])
    if @event.enabled != true
      redirect_to root_path
    end
  end
end