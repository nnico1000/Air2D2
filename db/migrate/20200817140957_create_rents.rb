class CreateRents < ActiveRecord::Migration[6.0]
  def change
    create_table :rents do |t|
      t.integer :start_year
      t.integer :end_year
      t.integer :price_per_year
      t.references :user, null: false, foreign_key: true
      t.references :droid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
