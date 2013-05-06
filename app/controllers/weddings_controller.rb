class WeddingsController < ApplicationController
  def show
    @wedding = Wedding.find(params[:id])
  end
end