class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :slug
      t.text :address
      t.float :latitude
      t.float :longitude
      t.integer :price_in_pence
      t.string :phone_number
      t.string :email
      
      t.boolean :is_verified, default: false

      t.timestamps null: false
    end
  end
end
