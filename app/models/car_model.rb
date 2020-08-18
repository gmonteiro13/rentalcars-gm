class CarModel < ApplicationRecord
  belongs_to :car_category
  validates(:name, :year, :manufacturer, :motorization, :fuel_type, presence: true)
end
