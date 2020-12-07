class UpdateDishesNotToAllowNulls < ActiveRecord::Migration[5.2]
  def change
    Dish.where(prep_time: nil).update_all(prep_time: 0)
    Dish.where(cook_time: nil).update_all(cook_time: 0)
    Dish.where(servings: nil).update_all(servings: 0)

    change_column_null(:dishes, :prep_time, false)
    change_column_null(:dishes, :cook_time, false)
    change_column_null(:dishes, :servings, false)
  end
end
