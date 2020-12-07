class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.references :product, foreign_key: true, null: false
      t.references :dish, foreign_key: true, null: false
      t.integer :unit, null: false
      t.decimal :quantity, null: false, precision: 8, scale: 2
      t.timestamps null: false
    end
  end
end
