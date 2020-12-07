# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users_quantity = User.count
(15 - users_quantity).times do
  FactoryGirl.create(:user)
end

times = [10, 20, 30]

User.first(5).each do |user|
  dishes_quantity = user.dishes.count
  (10 - dishes_quantity).times do
    dish = FactoryGirl.create(:dish, user: user, prep_time: times.sample, cook_time: times.sample, servings: 4)
    FactoryGirl.create(:menu_item, user: user, dish: dish, day: MenuItem::DAYS.sample, meal: MenuItem::MEALS.sample)
  end
end

# create full menu for first user
user = User.first
MenuItem::DAYS.each do |day|
  MenuItem::MEALS.each do |meal|
    FactoryGirl.create(:menu_item, user: user, dish: user.dishes.sample, day: day, meal: meal)
  end
end
