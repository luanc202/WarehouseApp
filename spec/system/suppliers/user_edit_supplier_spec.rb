require 'rails_helper'

describe 'Usuário edita um fornecedor' do
  it 'a partir da página de detalhes' do
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                     full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')

    visit root_path
    within 'nav' do
      click_on 'Fornecedores'
    end
    click_on 'ACME LTDA'
    click_on 'Editar'

    expect(page).to have_content('Editar Fornecedor')
    expect(page).to have_field('Razão Social', with: 'ACME LTDA')
    expect(page).to have_field('Nome Fantasia', with: 'ACME')
    expect(page).to have_field('Número de Registro', with: '43447216000102')
    expect(page).to have_field('Endereço Completo', with:  'Av da Palmas, 123')
    expect(page).to have_field('Cidade', with: 'Bauru')
    expect(page).to have_field('Estado', with: 'SP')
    expect(page).to have_field('E-mail', with: 'contato@acme.com')
  end

  it 'com sucesso' do
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                     full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')

    visit root_path
    within 'nav' do
      click_on 'Fornecedores'
    end
    click_on 'ACME LTDA'
    click_on 'Editar'
    fill_in 'Razão Social', with: 'Infinito SA.'
    fill_in 'Nome Fantasia', with: 'Infinito'
    fill_in 'Número de Registro', with: '79423226000102'
    fill_in 'Endereço Completo', with: 'Av da Rui Castro, 776'
    fill_in 'E-mail', with: 'contato@infinito.nix'
    click_on 'Atualizar Fornecedor'

    expect(page).to have_content('Fornecedor atualizado com sucesso')
    expect(page).to have_content('Fornecedor Infinito')
    expect(page).to have_content('Infinito SA.')
    expect(page).to have_content('Documento: 79423226000102')
    expect(page).to have_content('Endereço: Av da Rui Castro, 776')
    expect(page).to have_content('E-mail: contato@infinito.nix')
  end

  it 'e mantém os campos obrigatórios' do
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                     full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')

    visit root_path
    within 'nav' do
      click_on 'Fornecedores'
    end
    click_on 'ACME LTDA'
    click_on 'Editar'
    fill_in 'Razão Social', with: ''
    fill_in 'Nome Fantasia', with: ''
    fill_in 'Número de Registro', with: ''
    fill_in 'Endereço Completo', with: ''
    fill_in 'E-mail', with: ''
    click_on 'Atualizar Fornecedor'

    expect(page).to have_content('Não foi possível atualizar Fornecedor.')
  end
end
