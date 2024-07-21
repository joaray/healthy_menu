class CreateDishes < ActiveRecord::Migration[7.1]
  def change
    create_table :dishes do |t|
      t.string :name, null: false
      t.text :details
      t.references :user, null: false, foreign_key: true
      t.boolean :public, null: false, default: false

      t.timestamps
    end

    add_index :dishes, :name
    add_index :dishes, :public
  end
end
