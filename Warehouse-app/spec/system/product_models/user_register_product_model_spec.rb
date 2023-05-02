require 'rails_helper'

describe 'Usuário cadastra modelo de produto' do
  it 'com sucesso' do
    supplier = Supplier.create!(corporate_name: 'Samsung Electronics Brasil Co.', brand_name: 'Samsung', registration_number: '73563216000102',
                                full_address: 'Av dos Smartphones, X43', city: 'Marília', state: 'SP', email: 'contato@samsung.sac.com')

    visit root_path
    within 'nav' do
      click_on 'Modelos de Produtos'
    end
    click_on 'Cadastrar Novo'
    fill_in 'Nome', with: 'TV 40 polegadas'
    fill_in 'Peso', with: 10_000
    fill_in 'Altura', with: 60
    fill_in 'Largura', with: 90
    fill_in 'Profundidade', with: 10
    fill_in 'SKU', with: 'TV40-SAMSU-BTV800'
    select 'Samsung', from: 'Fornecedor'
    click_on 'Criar Modelo de Produto'

    expect(page).to have_content('TV 40 polegadas')
    expect(page).to have_content('SKU: TV40-SAMSU-BTV800')
    expect(page).to have_content('Dimensão: 60cm x 90cm x 10cm')
    expect(page).to have_content('Peso: 10000g')
  end
end
