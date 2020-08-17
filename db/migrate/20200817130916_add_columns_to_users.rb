class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :species, :string
    add_column :users, :planet, :string
    add_column :users, :radio_frequency, :float
  end
end
