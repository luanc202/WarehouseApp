require 'rails_helper'

describe 'Usuário edita o pedido' do
  it 'e deve estar autenticado' do
    user = User.create!(name: 'João', email: 'joao@mail.com', password: '123456')
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')
    supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
    order = Order.create!(user:, warehouse:, supplier:,
                                estimated_delivery_date: 1.day.from_now)

    visit edit_order_path(order.id)

    expect(current_path).to eq new_user_session_path
  end

  it 'com sucesso' do
    user = User.create!(name: 'João', email: 'joao@mail.com', password: '123456')
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')
    supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
    Supplier.create!(corporate_name: 'Spark Industries Brasil LTDA', brand_name: 'Spark', registration_number: '624452333400043',
                     full_address: 'Distrito Industrial N33, Bloco 4B', city: 'Teresina', state: 'PI', email: 'contato@sparkindustries.com')
    order = Order.create!(user:, warehouse:, supplier:,
                          estimated_delivery_date: 1.day.from_now)

    login_as(user)
    visit root_path
    click_on 'Meus Pedidos'
    click_on order.code
    click_on 'Editar'
    fill_in 'Data Prevista de Entrega', with: '03/07/2023'
    select 'Spark Industries Brasil LTDA', from: 'Fornecedor'
    click_on 'Atualizar Pedido'

    expect(page).to have_content 'Pedido atualizado com sucesso'
    expect(page).to have_content 'Fornecedor: Spark Industries Brasil LTDA'
    expect(page).to have_content 'Data Prevista de Entrega: 03/07/2023'
  end

  it 'caso seja o responsável' do
    user = User.create!(name: 'João', email: 'joao@mail.com', password: '123456')
    other_user = User.create!(name: 'André', email: 'andre@mail.com', password: '!@VGWDQV')
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')
    supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
    Supplier.create!(corporate_name: 'Spark Industries Brasil LTDA', brand_name: 'Spark', registration_number: '624452333400043',
                     full_address: 'Distrito Industrial N33, Bloco 4B', city: 'Teresina', state: 'PI', email: 'contato@sparkindustries.com')
    order = Order.create!(user:, warehouse:, supplier:,
                          estimated_delivery_date: 1.day.from_now)

    login_as(other_user)
    visit edit_order_path(order.id)

    expect(current_path).to eq root_path
  end
end
