class RenameDetailsInDishToDescription < ActiveRecord::Migration[5.2]
  def up
    rename_column :dishes, :details, :description
  end

end
