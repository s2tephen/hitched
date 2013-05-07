class WeddingsController < ApplicationController
  def show
    @weddings = Wedding.find(params[:id])
  end

  def index
    @weddings = Wedding.all
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
end