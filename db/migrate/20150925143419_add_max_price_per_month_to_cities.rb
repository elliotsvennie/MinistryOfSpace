class AddMaxPricePerMonthToCities < ActiveRecord::Migration
  def change
    add_column :cities, :max_price_per_month, :integer
  end
end
