class AddPricePerYearToDroidModel < ActiveRecord::Migration[6.0]
  def change
    add_column :droids, :price_per_year, :integer
  end
end
