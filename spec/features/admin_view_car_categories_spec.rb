require 'rails_helper'

feature 'Admin view car categories' do
  scenario 'successfully' do
    # Arrange -> Preparação dos Dados
    CarCategory.create!(name: 'Top', daily_rate: 105.5, car_insurance: 58.5,
                        third_party_insurance: 10.5)
    CarCategory.create!(name: 'Flex', daily_rate: 80, car_insurance: 8.5,
                        third_party_insurance: 8.5)
    CarCategory.create!(name: 'Econo', daily_rate: 50, car_insurance: 8.5,
                        third_party_insurance: 8.5)
    # Act -> Executar o código
    visit root_path
    click_on 'Categorias'

    expect(current_path).to eq car_categories_path
    expect(page).to have_content('Top')
    expect(page).to have_content('Flex')
    expect(page).to have_content('Econo')
  end

  scenario 'and view details' do
    CarCategory.create!(name: 'Top', daily_rate: 105.5, car_insurance: 58.5,
                        third_party_insurance: 10.5)
    CarCategory.create!(name: 'Flex', daily_rate: 80, car_insurance: 8.5,
                        third_party_insurance: 8.5)

    visit root_path
    click_on 'Categorias'
    click_on 'Top'

    expect(page).to have_content('Top')
    expect(page).to have_content('R$ 105,50')
    expect(page).to have_content('R$ 58,50')
    expect(page).to have_content('R$ 10,50')
    expect(page).not_to have_content('Flex')
  end

  scenario 'and no car categories are created' do
    visit root_path
    click_on 'Categorias'

    expect(page).to have_content('Nenhuma categoria cadastrada')
  end

  scenario 'and return to home page' do
    CarCategory.create!(name: 'Top', daily_rate: 105.5, car_insurance: 58.5,
                        third_party_insurance: 10.5)

    visit root_path
    click_on 'Categorias'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to manufacturers page' do
    CarCategory.create!(name: 'Top', daily_rate: 105.5, car_insurance: 58.5,
                        third_party_insurance: 10.5)

    visit root_path
    click_on 'Categorias'
    click_on 'Top'
    click_on 'Voltar'

    expect(current_path).to eq car_categories_path
  end
end