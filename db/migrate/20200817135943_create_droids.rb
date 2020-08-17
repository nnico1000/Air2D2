class CreateDroids < ActiveRecord::Migration[6.0]
  def change
    create_table :droids do |t|
      t.string :name
      t.string :category
      t.string :builder
      t.integer :age
      t.text :description
      t.string :era
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
