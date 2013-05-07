class WeddingsController < ApplicationController
  def index
    @weddings = Wedding.all
  end

  def show
    @weddings = Wedding.find(params[:id])
  end

  def new
    @weddings = Wedding.new
  end

  def create
    @weddings = Wedding.create!(params[:wedding])
    redirect_to weddings_url, notice: "Wedding was successfully created."
  end

  def edit
    @weddings = Wedding.find(params[:id])
  end

  def update
    @weddings = Wedding.find(params[:id])
    @weddings.update_attributes!(params[:wedding])
    redirect_to weddings_url, notice: "Wedding was successfully updated."
  end

  def destroy
    @weddings = Wedding.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to weddings_url }
      format.js
    end
  end
end