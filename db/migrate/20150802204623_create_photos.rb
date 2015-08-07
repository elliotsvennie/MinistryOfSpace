class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :space_id
      t.string :photo

      t.timestamps null: false
    end
  end
end
