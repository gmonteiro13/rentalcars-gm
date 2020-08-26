require 'rails_helper'

feature 'User start rental' do
    scenario 'succesfully' do
        client = Client.create!(name: 'Gabriel Monteiro', email: 'biel@test.com', cpf: '529.807.163-59')
        
        car_category = CarCategory.create!(name: 'A', daily_rate: 1, car_insurance: 1, third_party_insurance:1)
        
        car_model = CarModel.create!(name: 'Ka', year: 2019, manufacturer: 'Ford',
        motorization: '1.0', car_category: car_category, fuel_type: 'Flex')

        user = User.create!(name: 'Monteiro Biel', email: 'user@test.com', password: '87654321')
        
        rental = Rental.create!(start_date: Date.current, end_date: 1.day.from_now, client: client, car_category: car_category, user: user)

        car = Car.create!(license_plate: 'ABC123', color: 'Prata', car_model: car_model, mileage: 0, )
        
        login_as user, scope: :user
        visit root_path
        click_on 'Locações'
        fill_in 'Busca de locação', with: rental.token
        click_on 'Buscar'
        click_on 'Ver detalhes'
        click_on 'Iniciar locação'

        select "#{car_model.name} - #{car.color} - #{car.license_plate}", from: 'Carros disponíveis'
        click_on 'Iniciar'

        # TODO: Pegar o nome e cnh do condutor, foto do carro

        expect(page).to have_content('Locação iniciada com sucesso')
        expect(page).to have_content(car.license_plate)
        expect(page).to have_content(car.color)
        expect(page).to have_content(car_model.name)
        expect(page).to have_content(car_category.name)
        expect(page).to have_content(user.email)
        expect(page).to have_content(client.email)
        expect(page).to have_content(client.name)
        expect(page).to have_content(client.cpf)
    end
end