class CitiesController < ApplicationController
  
  def index
    @city = City.first!
    
    redirect_to spaces_path(city: @city.slug)
  end
  
end
