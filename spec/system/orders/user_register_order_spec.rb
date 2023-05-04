require 'rails_helper'

describe 'Usuário cadastra um pedido' do
  it 'com sucesso' do
    user = User.create!(email: 'joao@email.com', password: '171653', name: 'João')
    Warehouse.create!(name: 'Cuiabá', code: 'CWB', city: 'Cuiabá', area: 70_000,
                      address: 'Av das Capivaras, 143', cep: '7550-000', description: 'Galpão Central Brasileiro')
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')
    supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
    Supplier.create!(corporate_name: 'Spark Industries Brasil LTDA', brand_name: 'Spark', registration_number: '624452333400043',
                     full_address: 'Distrito Industrial N33, Bloco 4B', city: 'Teresina', state: 'PI', email: 'contato@sparkindustries.com')

    login_as(user)
    visit root_path
    click_on 'Registrar Pedido'
    select 'GRU - Aeroporto SP', from: 'Galpão Destino'
    select supplier.corporate_name, from: 'Fornecedor'
    fill_in 'Data Prevista de Entrega', with: '10/05/2023'
    click_on 'Gravar'

    expect(page).to have_content('Pedido registrado com sucesso')
    expect(page).to have_content('Galpão Destino: GRU - Aeroporto SP')
    expect(page).to have_content('Fornecedor: ACME LTDA - ACME')
    expect(page).to have_content('Usuário Responsável: João | joao@email.com')
    expect(page).to have_content('Data Prevista de Entrega: 10/05/2023')
    expect(page).not_to have_content('Cuiabá')
    expect(page).not_to have_content('Spark Industries Brasil LTDA')
  end

  it 'e deve estar autenticado' do
    visit root_path
    click_on 'Registrar Pedido'

    expect(current_path).to eq new_user_session_path
  end
end
