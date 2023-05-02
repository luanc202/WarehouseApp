require 'rails_helper'

describe 'Usuário se autentica' do
  it 'com sucesso' do
    User.create!(email: 'joao@email.com', password: '171653')

    visit root_path
    within 'nav' do
      click_on 'Entrar'
    end

    within 'form' do
      fill_in 'E-mail', with: 'joao@email.com'
      fill_in 'Senha', with: '171653'
      click_on 'Entrar'
    end

    within 'nav' do
      expect(page).not_to have_link('Entrar')
      expect(page).to have_link('Sair')
      expect(page).to have_content('joao@email.com')
    end
    expect(page).to have_content('Login efetuado com sucesso.')
  end
end
