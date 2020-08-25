require 'rails_helper'

feature 'Admin edits manufacturer' do
  scenario 'successfully' do
    CarCategory.create!(name: 'Top', daily_rate: 105.5, car_insurance: 58.5,
                        third_party_insurance: 10.5)
    user = User.create!(email: 'test@test.com', password: '12345678')
    
    login_as user

    visit root_path
    click_on 'Categorias'
    click_on 'Top'
    click_on 'Editar'
    fill_in 'Nome', with: 'Flex'
    fill_in 'Diária', with: '80'
    fill_in 'Seguro do Carro', with: '50'
    fill_in 'Seguro para Terceiros', with: '10'
    click_on 'Enviar'

    expect(page).to have_content('Flex')
    expect(page).not_to have_content('Top')
    expect(page).to have_content('R$ 80,00')
    expect(page).to have_content('R$ 50,00')
    expect(page).to have_content('R$ 10,00')
  end

  scenario 'attributes cannot be blank' do
    CarCategory.create!(name: 'Top', daily_rate: 105.5, car_insurance: 58.5,
                        third_party_insurance: 10.5)

    user = User.create!(email: 'test@test.com', password: '12345678')
    
    login_as user
    visit root_path
    click_on 'Categorias'
    click_on 'Top'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    fill_in 'Diária', with: ''
    fill_in 'Seguro do Carro', with: ''
    fill_in 'Seguro para Terceiros', with: ''
    click_on 'Enviar'

    expect(page).to have_content('não pode ficar em branco', count: 4)
  end

  scenario 'name must be unique' do
    CarCategory.create!(name: 'Top', daily_rate: 105.5, car_insurance: 58.5,
                        third_party_insurance: 10.5)
    CarCategory.create!(name: 'Flex', daily_rate: 80, car_insurance: 8.5,
                        third_party_insurance: 8.5)

    user = User.create!(email: 'test@test.com', password: '12345678')
    
    login_as user
    visit root_path
    click_on 'Categorias'
    click_on 'Flex'
    click_on 'Editar'
    fill_in 'Nome', with: 'Top'
    click_on 'Enviar'

    expect(page).to have_content('já está em uso')
  end
end
