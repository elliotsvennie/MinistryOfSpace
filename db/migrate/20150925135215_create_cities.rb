class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :slug
      t.string :currency_unit
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
