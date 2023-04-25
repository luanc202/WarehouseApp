require 'rails_helper'

describe 'Usuário cadastra um galpão' do
  it 'a partir da tela inicial' do
    # Arrange

    # Act
    visit root_path
    click_on 'Cadastrar Galpão'

    # Assert
    expect(page).to have_content('Nome')
    expect(page).to have_content('Descrição')
    expect(page).to have_content('Código')
    expect(page).to have_content('Endereço')
    expect(page).to have_content('CEP')
    expect(page).to have_content('Área')
  end

  it 'com sucesso' do
    # Arrange

    # Act
    visit root_path
    click_on 'Cadastrar Galpão'
    fill_in 'Nome', with: 'Rio de Janeiro'
    fill_in 'Descrição', with: 'Galpão da zona portuária do Rio'
    fill_in 'Código', with: 'RIO'
    fill_in 'Endereço', with: 'Avenida do Museu do Amanhã, 1000'
    fill_in 'Cidade', with: 'Rio de Janeiro'
    fill_in 'CEP', with: '2100-000'
    fill_in 'Área', with: '32000'
    click_on 'Enviar'

    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content('Galpão cadastrado com sucesso')
    expect(page).to have_content('Rio de Janeiro')
    expect(page).to have_content('RIO')
    expect(page).to have_content('32000 m2')
  end
end
