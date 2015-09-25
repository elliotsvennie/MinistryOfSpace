class CompaniesController < ApplicationController
  
  before_action :get_city
  
  def index
    @companies = @city.companies.where("is_verified = ?", true).order("created_at desc")
  end

  def new
    @company = @city.companies.new
  end
  
  def create
    @company = @city.companies.new(company_attributes)
    @company.is_verified = false
    
    if @company.save
      CompaniesMailer.new_company(@company).deliver_now
    else
      render "new"
    end
  end
  
  private
  
  def get_city
    @city = City.find_by_slug(params[:city])
  end
  
  def company_attributes
    params.require(:company).permit(
      :company_name, :contact_name, :email, :stay_anonymous, :where, :how_many,
      :is_private, :is_open_office, :is_co_working, :is_shared_office, 
      :how_much, :how_long, :when
    )
  end

end
