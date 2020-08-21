require 'rails_helper'

feature 'User sign in' do
    
    # Objetivo: a partir da tela inicial, ir para a tela de login
    scenario 'from home page' do
        # Arrange

        # Act
        visit root_path

        # Assert
        expect(page).to have_link('Entrar')
    end

    scenario 'successfully' do
        # Arrange
        User.create!(name: 'Gabriel Monteiro', email: 'biel@email.com', password: '87654321')

        # Act
        visit root_path
        click_on 'Entrar'
        fill_in 'Email', with: 'biel@email.com'
        fill_in 'Senha', with: '87654321'
        click_on 'Entrar'

        # Assert
        expect(page).to have_content 'Gabriel Monteiro'
        expect(page).to have_content 'Login efetuado com sucesso'
        expect(page).to have_link 'Sair'
        expect(page).not_to have_link 'Entrar'
    end

    xscenario 'and sign out'

    # Arrange 
    # Cria um user

    # Act
    # Faz login e clica em sair

    # Assert
    # Inverte as expectativas do sign in
end