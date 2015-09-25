class Company < ActiveRecord::Base
  
  belongs_to :city
  
  def display_name
    if stay_anonymous.present?
      "Anonymous Company"
    else
      company_name
    end
  end
  
  def looking_for
    [
      ("private office" if self.is_private), 
      ("open office space" if self.is_open_office), 
      ("co-working" if self.is_co_working), 
      ("shared office" if self.is_shared_office)
    ].compact
  end
  
end
