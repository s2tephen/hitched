class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to @event, notice: "Comment was successfully posted."
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @comment = @event.comments.find(params[:id])
    @comment.destroy
    redirect_to @event, notice: "Comment was successfully deleted."
  end

  def index
  end
end