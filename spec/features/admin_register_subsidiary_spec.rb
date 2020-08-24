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
    fill_in 'CNPJ', with: '52.480.193/3082-55'
    click_on 'Enviar'

    expect(page).to have_content('Filial criada com sucesso!')
    expect(page).to have_content('Moema')
    expect(page).to have_content('Alameda dos Nhambiquaras 1647')
    expect(page).to have_content('52.480.193/3082-55')
  end

  scenario 'must fill in all fields' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar uma nova filial'
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('CNPJ não pode ficar em branco')
    expect(page).to have_content('Endereço não pode ficar em branco')

  end

  scenario 'CNPJ must be valid' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar uma nova filial'
    fill_in 'CNPJ', with: '32.435.435/0012-00'
    click_on 'Enviar'

    expect(page).to have_content('CNPJ não é válido')
  end
end