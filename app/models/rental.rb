class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category
  belongs_to :user

  before_create :generate_token

  def total
    number_of_days_rented = end_date - start_date
    
    number_of_days_rented * car_category.daily_price
  end

  private

  def generate_token
    self.token = SecureRandom.alphanumeric(6).upcase
  end

end
