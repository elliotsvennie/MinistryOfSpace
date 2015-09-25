class CompaniesMailer < ApplicationMailer
  def new_company(company)
    @company = company
    mail to: "hello@ministryofstartups.co.uk", subject: "New company"
  end
end
