require 'rails_helper'

describe 'Usuário se autentica' do
  it 'com sucesso' do
    User.create!(email: 'joao@email.com', password: '171653', name: 'João')

    visit root_path
    within 'nav' do
      click_on 'Entrar'
    end
    fill_in 'E-mail', with: 'joao@email.com'
    fill_in 'Senha', with: '171653'
    within 'form' do
      click_on 'Entrar'
    end

    within 'nav' do
      expect(page).not_to have_link('Entrar')
      expect(page).to have_button('Sair')
      expect(page).to have_content('João | joao@email.com')
    end
    expect(page).to have_content('Login efetuado com sucesso.')
  end

  it 'faz logout' do
    User.create!(email: 'joao@email.com', password: '171653', name: 'João')

    visit root_path
    within 'nav' do
      click_on 'Entrar'
    end
    fill_in 'Senha', with: '171653'
    fill_in 'E-mail', with: 'joao@email.com'
    within 'form' do
      click_on 'Entrar'
    end
    click_on 'Sair'

    expect(page).to have_content('Logout efetuado com sucesso.')
    within 'nav' do
      expect(page).to have_link('Entrar')
      expect(page).not_to have_button('Sair')
      expect(page).not_to have_content('joao@email.com')
    end
  end
end
