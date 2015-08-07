class SpacesMailer < ApplicationMailer
  def new_space(space)
    @space = space
    mail to: "hello@ministryofstartups.co.uk", subject: "New space"
  end
end
