require 'rails_helper'

describe 'Usuário adiciona itens ao pedido' do
  it 'com sucesso' do
    supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
    user = User.create!(name: 'João', email: 'joao@mail.com', password: '123456')
    product_a = ProductModel.create!(name: 'Produto A', weight: 15, width: 10, height: 20, depth: 30, supplier:,
                                     sku: 'SH3RGLKRJG')
    product_b = ProductModel.create!(name: 'Produto B', weight: 15, width: 10, height: 20, depth: 30, supplier:,
                                     sku: 'SH3RGLG3JG')
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')
    order = Order.create!(user:, warehouse:, supplier:,
                          estimated_delivery_date: 1.day.from_now)

    login_as(user)
    visit root_path
    click_on 'Meus Pedidos'
    click_on order.code
    click_on 'Adicionar Item'

    fill_in 'Quantidade', with: 8
    select 'Produto A', from: 'Produto'
    click_on 'Adicionar'

    expect(current_path).to eq order_path(order.id)
    expect(page).to have_content('Item adicionado com sucesso')
    expect(page).to have_content('8 x Produto A')
  end

  it 'e não vê produtos de outro fornecedor' do
    supplier_a = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                  full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
    supplier_b = Supplier.create!(corporate_name: 'Spark Industries Brasil LTDA', brand_name: 'Spark', registration_number: '624452333400043',
                                  full_address: 'Distrito Industrial N33, Bloco 4B', city: 'Teresina', state: 'PI', email: 'contato@sparkindustries.com')
    product_a = ProductModel.create!(name: 'Produto A', weight: 15, width: 10, height: 20, depth: 30, supplier: supplier_a,
                                     sku: 'SH3RGLKRJG')
    product_b = ProductModel.create!(name: 'Produto B', weight: 15, width: 10, height: 20, depth: 30, supplier: supplier_b,
                                     sku: 'SH3RGLG3JG')
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')
    user = User.create!(name: 'João', email: 'joao@mail.com', password: '123456')
    order = Order.create!(user:, warehouse:, supplier: supplier_a,
                          estimated_delivery_date: 1.day.from_now)

    login_as(user)
    visit root_path
    click_on 'Meus Pedidos'
    click_on order.code
    click_on 'Adicionar Item'

    fill_in 'Quantidade', with: 8
    select 'Produto A', from: 'Produto'
    click_on 'Adicionar'

    expect(page).to have_content('Produto A')
    expect(page).not_to have_content('Produto B')
  end
end
