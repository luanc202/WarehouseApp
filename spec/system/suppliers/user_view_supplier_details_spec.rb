require 'rails_helper'

describe 'Usuário vê detalhes do fornecedor' do
  it 'a partir da tela inicial de fornecedores' do
      
      Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                      full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')

      visit root_path
      within 'nav' do
        click_on 'Fornecedores'
      end
      click_on 'ACME LTDA'

      expect(page).to have_content('ACME LTDA')
      expect(page).to have_content('Documento: 43447216000102')
      expect(page).to have_content('Endereço: Av da Palmas, 123')
      expect(page).to have_content('E-mail: contato@acme.com')
    end

    it 'e volta para a tela de fornecedores' do
      Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                      full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')

      visit root_path
      within 'nav' do
        click_on 'Fornecedores'
      end
      click_on 'ACME LTDA'
      click_on 'Voltar'

      expect(current_path).to eq root_path
    end
  end