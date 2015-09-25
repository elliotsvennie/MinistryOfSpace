class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :city_id
      t.string :company_name
      t.string :contact_name
      t.string :email
      t.boolean :stay_anonymous, default: false
      t.string :where
      t.integer :how_many
      t.boolean :is_private, default: false
      t.boolean :is_open_office, default: false
      t.boolean :is_co_working, default: false
      t.boolean :is_shared_office, default: false
      t.integer :how_much
      t.string :how_long
      t.string :when

      t.timestamps null: false
    end
  end
end
