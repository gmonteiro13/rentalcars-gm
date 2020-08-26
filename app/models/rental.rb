class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category
  belongs_to :user

  def total
    number_of_days_rented = end_date - start_date
    
    number_of_days_rented * car_category.daily_price
  end
end
