class Dish < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  def css_class
    public? ? 'primary' : 'danger'
  end

  def button_text
    public? ? 'Make Private' : 'Make Public'
  end
end
