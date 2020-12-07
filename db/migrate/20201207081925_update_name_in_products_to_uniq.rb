class UpdateNameInProductsToUniq < ActiveRecord::Migration[5.2]
  def up
    change_column :products, :name, :string, unique: true
  end

  def down
    change_column :products, :name, :string
  end
end
