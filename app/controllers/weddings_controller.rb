class WeddingsController < ApplicationController
  def show
    @wedding = Wedding.find(params[:id])
  end

  def index
    @wedding = Wedding.all
  end

  def new
    @wedding = Wedding.new
  end

  def create
    @wedding = Wedding.create!(params[:wedding])
    redirect_to weddings_url, notice: "Wedding was successfully created."
  end

  def edit
    @wedding = Wedding.find(params[:id])
  end

  def update
    @wedding = Wedding.find(params[:id])
    @wedding.update_attributes!(params[:wedding])
    redirect_to weddings_url, notice: "Wedding was successfully updated."
  end
end