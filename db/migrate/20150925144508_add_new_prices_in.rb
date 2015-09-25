class AddNewPricesIn < ActiveRecord::Migration
  def change
    rename_column :spaces, :price_in_pence, :fixed_desk_price_in_base
    add_column :spaces, :hot_desk_price_in_base, :integer
  end
end
