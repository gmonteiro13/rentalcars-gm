require 'rails_helper'

feature 'Admin register valid car category' do
  scenario 'and attributes cannot be blank' do
    user = User.create!(email: 'test@test.com', password: '12345678')
    
    login_as user
    visit root_path
    click_on 'Categorias'
    click_on 'Registrar uma nova categoria'
    fill_in 'Nome', with: ''
    fill_in 'Diária', with: ''
    fill_in 'Seguro do Carro', with: ''
    fill_in 'Seguro para Terceiros', with: ''
    click_on 'Enviar'

    expect(page).to have_content('não pode ficar em branco', count: 4)
    expect(CarCategory.count).to eq 0
  end

  scenario 'and name must be unique' do
    CarCategory.create!(name: 'Top', daily_rate: 105.5, car_insurance: 58.5,
                        third_party_insurance: 10.5)
    
    user = User.create!(email: 'test@test.com', password: '12345678')
    
    login_as user
    visit root_path
    click_on 'Categorias'
    click_on 'Registrar uma nova categoria'
    fill_in 'Nome', with: 'Top'
    fill_in 'Diária', with: '100'
    fill_in 'Seguro do Carro', with: '50'
    fill_in 'Seguro para Terceiros', with: '10'
    click_on 'Enviar'

    expect(page).to have_content('já está em uso')
  end
end
