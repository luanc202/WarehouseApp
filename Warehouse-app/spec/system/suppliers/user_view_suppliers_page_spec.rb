require 'rails_helper'

describe 'Usuário vê fornecedores' do
  it 'a partir do menu' do

    visit root_path
    within 'nav' do
      click_on 'Fornecedores'
    end

    expect(current_path).to eq(suppliers_path)
  end

  it 'com sucesso' do

    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                     full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
    Supplier.create!(corporate_name: 'Spark Industries Brasil LTDA', brand_name: 'Spark', registration_number: '624452333400043',
                     full_address: 'Distrito Industrial N33, Bloco 4B', city: 'Teresina', state: 'PI', email: 'contato@sparkindustries.com')

    visit root_path
    within 'nav' do
      click_on 'Fornecedores'
    end

    expect(page).to have_content('Fornecedores')
    expect(page).to have_content('ACME LTDA')
    expect(page).to have_content('Bauru·-·SP')
    expect(page).to have_content('Spark')
    expect(page).to have_content('Teresina·-·PI')
  end

  it 'e não existem fornecedores cadastrados' do
      
      visit root_path
      within 'nav' do
        click_on 'Fornecedores'
      end
  
      expect(page).to have_content('Não existem Fornecedores cadastrados')
  end
end
