class AddIsVerifiedToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :is_verified, :boolean, default: false
  end
end
