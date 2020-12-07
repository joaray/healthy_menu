class AddPrepTimeAndCookTimeAndServings < ActiveRecord::Migration[5.2]
  def change
    add_column :dishes, :prep_time, :integer
    add_column :dishes, :cook_time, :integer
    add_column :dishes, :servings, :integer
  end
end
