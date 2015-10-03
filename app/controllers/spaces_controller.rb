class SpacesController < ApplicationController
  
  before_action :get_city
  
  def index
    @spaces = @city.spaces.includes(:photos).list
    
    if params[:desk_type] == "hotdesk"
      @filter = "hot_desk_price_in_base"
      @spaces = @spaces.where("hot_desk_price_in_base is not null")
    else
      @filter = "fixed_desk_price_in_base"
      @spaces = @spaces.where("fixed_desk_price_in_base is not null")
    end
    
    if params[:has_full_access] == "1"
      @spaces = @spaces.where(has_full_access: true)
    end
    
    if params[:min_price].present? and params[:max_price].present?
      min = params[:min_price].to_f * 100
      max = params[:max_price].to_f * 100
      @spaces = @spaces.where("#{@filter} >= ? and #{@filter} <= ?", min, max)
    end
    
  end

  def show
    @space = @city.spaces.includes(:photos).find_by_slug!(params[:id])
  end

  def new
    @space = @city.spaces.new
    20.times do |i|
      @space.photos.build(rank: i)
    end
  end
  
  def create
    @space = @city.spaces.new(space_attributes)
    
    if @space.save
      SpacesMailer.new_space(@space).deliver_now
    else
      render "new"
    end
  end
  
  private
  
  def get_city
    @city = City.find_by_slug(params[:city])
  end
  
  def space_attributes
    params.require(:space).permit(
      :name, :address, :postcode, :fixed_desk_price_in_base, :hot_desk_price_in_base, 
      :has_full_access, :description, :phone_number, :email, :twitter,
      photos_attributes: [:photo, :rank]
    )
  end
end
