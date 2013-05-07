class EventsController < ApplicationController
  def index
   @events = Event.find_all_by_wedding_id(current_user.wedding_id)
  end

  def show
    @events = Event.find(params[:id])
    @comments = @events.comments.paginate(page: params[:page])
    if @events.enabled != true
      redirect_to events_url
    end
  end

  def new
    @events = Event.new
  end

  def create
    @events = Event.create!(params[:event])
    redirect_to events_url
  end

    def edit
    @events = Event.find(params[:id])
  end

  def update
    @events = Event.find(params[:id])
    @events.update_attributes!(params[:event])
    # respond_to do |format|
    #   format.html { redirect_to events_url }
    #   format.js
    # end

    redirect_to events_url, notice: "Event was successfully updated."
  end

  def destroy
    @events = Event.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to events_url }
      format.js
    end
  end
end