require 'rails_helper'

feature 'Admin register subsidiary' do
  scenario 'from index page' do
    visit root_path
    click_on 'Filiais'

    expect(page).to have_link('Registrar uma nova filial',
                              href: new_subsidiary_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar uma nova filial'

    fill_in 'Nome', with: 'Moema'
    fill_in 'Endereço', with: 'Alameda dos Nhambiquaras 1647'
    fill_in 'CNPJ', with: '84306178000255'
    click_on 'Enviar'

    expect(page).to have_content('Moema')
    expect(page).to have_content('Alameda dos Nhambiquaras 1647')
    expect(page).to have_content('84306178000255')
  end
end