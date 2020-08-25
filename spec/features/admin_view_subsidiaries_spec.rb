require 'rails_helper'

feature 'Admin view subsidiaries' do
    scenario 'succesfully' do

        # Arrange -> Preparação dos dados
        Subsidiary.create!(name: 'Moema', cnpj: '52.480.193/3082-55',
                       address: 'Alameda dos Nhambiquaras 1647')
        Subsidiary.create!(name: 'Barra Funda', cnpj: '76.546.851/9382-42',
                       address: 'Estádio do Palmeiras')
        Subsidiary.create!(name: 'Centro SV', cnpj: '47.199.096/7475-03',
                        address: 'Praça Coronel Lopes s/n')

        #Act -> Executar o código
        visit root_path
        click_on 'Filiais'
        
        expect(current_path).to eq subsidiaries_path
        expect(page).to have_content('Moema')
        expect(page).to have_content('Barra Funda')
        expect(page).to have_content('Centro SV')

    end

    scenario 'and no car categories are created' do
        visit root_path
        click_on 'Filiais'
    
        expect(page).to have_content('Nenhuma filial cadastrada')
    end

    scenario 'and return to home page' do
        Subsidiary.create!(name: 'Moema', cnpj: '52.480.193/3082-55',
                       address: 'Alameda dos Nhambiquaras 1647')
    
        visit root_path
        click_on 'Filiais'
        click_on 'Voltar'
    end

    scenario 'and return to subsidiaries page' do
        Subsidiary.create!(name: 'Moema', cnpj: '52.480.193/3082-55',
                       address: 'Alameda dos Nhambiquaras 1647')
    
        visit root_path
        click_on 'Filiais'
        click_on 'Moema'
        click_on 'Voltar'
    
        expect(current_path).to eq subsidiaries_path
    end

end