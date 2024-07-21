class DishesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dish, only: %i[show edit update destroy toggle_public]

  def index
    @dishes = current_user.dishes.order(created_at: :desc)
  end

  def new
    @dish = current_user.dishes.build
  end

  def create
    @dish = current_user.dishes.build(dish_params)

    if @dish.save
      redirect_to dish_url(@dish), notice: "Dish was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @dish.update(dish_params)
      redirect_to dish_url(@dish), notice: "Dish was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dish.destroy!

    redirect_to dishes_url, notice: "Dish was successfully destroyed."
  end

  def toggle_public
    @dish.toggle!(:public)
    redirect_back fallback_location: dishes_path, notice: "#{@dish.name} visibility was successfully updated."
  rescue ActiveRecord::RecordInvalid
    redirect_back fallback_location: dishes_path, alert: "There was a problem updating #{@dish.name} visibility."
  end

  private
    def set_dish
      @dish = Dish.find(params[:id])
    end

    def dish_params
      params.require(:dish).permit(:name, :details, :user_id, :public)
    end
end
