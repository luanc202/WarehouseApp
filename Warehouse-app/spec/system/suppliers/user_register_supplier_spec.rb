require 'rails_helper'

describe 'Usuário cadastra um fornecedor' do
  it 'a partir da tela inicial' do
    visit root_path
    within 'nav' do
      click_on 'Fornecedores'
    end
    click_on 'Cadastrar novo Fornecedor'

    expect(page).to have_content('Razão Social')
    expect(page).to have_content('Nome Fantasia')
    expect(page).to have_content('Número de Registro')
    expect(page).to have_content('Endereço Completo')
    expect(page).to have_content('Cidade')
    expect(page).to have_content('Estado')
    expect(page).to have_content('E-mail')
  end

  it 'com sucesso' do
    visit root_path
    within 'nav' do
      click_on 'Fornecedores'
    end
    click_on 'Cadastrar novo Fornecedor'
    fill_in 'Razão Social', with: 'ACME LTDA'
    fill_in 'Nome Fantasia', with: 'ACME'
    fill_in 'Número de Registro', with: '43447216000102'
    fill_in 'Endereço Completo', with: 'Av da Palmas, 123'
    fill_in 'Cidade', with: 'Bauru'
    fill_in 'Estado', with: 'SP'
    fill_in 'E-mail', with: 'contato@acme.com'
    click_on 'Criar Fornecedor'

    expect(current_path).to eq suppliers_path
    expect(page).to have_content('Fornecedor cadastrado com sucesso')
    expect(page).to have_content('ACME LTDA')
    expect(page).to have_content('ACME')
    expect(page).to have_content('Bauru·-·SP')
  end

  it 'com dados incompletos' do
    visit root_path
    within 'nav' do
      click_on 'Fornecedores'
    end
    click_on 'Cadastrar novo Fornecedor'
    fill_in 'Razão Social', with: ''
    fill_in 'Nome Fantasia', with: ''
    fill_in 'Número de Registro', with: ''
    click_on 'Criar Fornecedor'

    expect(page).to have_content('Fornecedor não cadastrado')
    expect(page).to have_content('Razão Social não pode ficar em branco')
    expect(page).to have_content('Nome Fantasia não pode ficar em branco')
    expect(page).to have_content('Número de Registro não pode ficar em branco')
  end
end
