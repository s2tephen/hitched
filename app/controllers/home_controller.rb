class HomeController < ApplicationController
  def index
  	if current_user != nil
  		redirect_to events_url
  	else
    	@users = User.all
    end
  end
end
