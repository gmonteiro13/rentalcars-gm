require 'rails_helper'

feature 'Admin view subsidiaries' do
    scenario 'succesfully' do

        # Arrange -> Preparação dos dados
        Subsidiary.create!(name: 'Moema', CNPJ: '84306178000155',
                       address: 'Alameda dos Nhambiquaras 1647')
        Subsidiary.create!(name: 'Barra Funda', CNPJ: '84306178000255',
                       address: 'Estádio do Palmeiras')
        Subsidiary.create!(name: 'Centro SV', CNPJ: '84306178000355',
                        address: 'Praça Coronel Lopes s/n')

        #Act -> Executar o código
        visit root_path
        click_on 'Filiais'
        
        expect(current_path).to eq subsidiaries_path
        expect(page).to have_content('Moema')
        expect(page).to have_content('Barra Funda')
        expect(page).to have_content('Centro SV')

    end
end