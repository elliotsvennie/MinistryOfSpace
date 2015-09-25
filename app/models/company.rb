class Company < ActiveRecord::Base
  
  belongs_to :city
  
  def display_name
    if stay_anonymous.present?
      "Anonymous Company"
    else
      company_name
    end
  end
  
end
