class SpacesController < ApplicationController
  
  def index
    @spaces = Space.includes(:photos).list
    
    if params[:desk_type] == "hotdesk" or params[:desk_type] == "fixed"
      @spaces = @spaces.where(desk_type: params[:desk_type])
    end
    
    if params[:has_full_access] == "1"
      @spaces = @spaces.where(has_full_access: true)
    end
    
    if params[:min_price].present? and params[:max_price].present?
      min = params[:min_price].to_f * 100
      max = params[:max_price].to_f * 100
      @spaces = @spaces.where("price_in_pence >= ? and price_in_pence <= ?", min, max)
    end
    
  end

  def show
    @space = Space.includes(:photos).find_by_slug!(params[:slug])
  end

  def new
    @space = Space.new
    20.times do |i|
      @space.photos.build(rank: i)
    end
  end
  
  def create
    @space = Space.new(space_attributes)
    
    if @space.save
      SpacesMailer.new_space(@space).deliver_now
    else
      render "new"
    end
  end
  
  private
  def space_attributes
    params.require(:space).permit(
      :name, :address, :price_in_pounds, :desk_type, :has_full_access,
      :description, :phone_number, :email, :twitter,
      photos_attributes: [:photo, :rank]
    )
  end
end
