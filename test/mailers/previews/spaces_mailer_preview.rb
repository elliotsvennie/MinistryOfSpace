# Preview all emails at http://localhost:3000/rails/mailers/spaces_mailer
class SpacesMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/spaces_mailer/new
  def new
    SpacesMailer.new
  end

end
