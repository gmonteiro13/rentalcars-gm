require 'rails_helper'

RSpec.describe Rental, type: :model do
  context 'token' do
    it 'generate on create' do
      client = Client.create!(name: 'Gabriel Monteiro', email: 'biel@test.com', cpf: '529.807.163-59')
      car_category = CarCategory.create!(name: 'A', daily_rate: 1, car_insurance: 1, third_party_insurance:1)
      user = User.create!(name: 'Monteiro Biel', email: 'user@test.com', password: '87654321')
      rental = Rental.new(start_date: Date.current, end_date: 1.day.from_now, client: client, car_category: car_category, user: user)
    
      rental.save!
      

      expect(rental.token).to be_present
      expect(rental.token.size).to eq(6)
      expect(rental.token).to match(/^[A-Z0-9]+$/)
    end

    xit 'must be unique' do
    end
  end
end
