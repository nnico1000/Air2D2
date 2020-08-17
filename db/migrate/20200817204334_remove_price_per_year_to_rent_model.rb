class RemovePricePerYearToRentModel < ActiveRecord::Migration[6.0]
  def change
    remove_column :rents, :price_per_year
  end
end
