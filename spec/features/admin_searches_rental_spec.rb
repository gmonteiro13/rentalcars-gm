require 'rails_helper'

feature 'Admin searches rental' do
    scenario 'and find exact match' do
        client = Client.create!(name: 'Gabriel Monteiro', email: 'biel@test.com', cpf: '529.807.163-59')
        car_category = CarCategory.create!(name: 'A', daily_rate: 1, car_insurance: 1, third_party_insurance:1)
        user = User.create!(name: 'Monteiro Biel', email: 'user@test.com', password: '87654321')
        rental = Rental.create!(start_date: Date.current, end_date: 1.day.from_now, client: client, car_category: car_category, user: user)
        
        login_as user, scope: :user
        visit root_path
        click_on 'Locações'
        fill_in 'Busca de locação', with: rental.token
        click_on 'Buscar'

        expect(page).to have_content(rental.token)
        expect(page).to have_content(client.name)
        expect(page).to have_content(client.email)
        expect(page).to have_content(client.cpf)
        expect(page).to have_content(rental.car_category.name)
        expect(page).to have_content(rental.user.email)
    end

    xscenario 'and finds nothing' do
    end

    scenario 'finds by partial token' do
        client = Client.create!(name: 'Gabriel Monteiro', email: 'biel@test.com', cpf: '529.807.163-59')
        
        car_category = CarCategory.create!(name: 'A', daily_rate: 1, car_insurance: 1, third_party_insurance:1)
        
        user = User.create!(name: 'Monteiro Biel', email: 'user@test.com', password: '87654321')
        
        rental = Rental.create!(start_date: Date.current, end_date: 1.day.from_now, client: client, car_category: car_category, user: user)
        rental.update(token:'ABC123')
        
        another_rental = Rental.create!(start_date: Date.current, end_date: 1.day.from_now, client: client, car_category: car_category, user: user)
        another_rental.update(token: 'ABC567')

        rental_not_to_be_found = Rental.create!(start_date: Date.current, end_date: 1.day.from_now, client: client, car_category: car_category, user: user)
        rental_not_to_be_found.update(token: '485866')
        
        login_as user, scope: :user
        visit root_path
        click_on 'Locações'
        fill_in 'Busca de locação', with: 'ABC'
        click_on 'Buscar'

        expect(page).to have_content(rental.token)
        expect(page).to have_content(another_rental.token)
        expect(page).not_to have_content(rental_not_to_be_found.token)
    end
end