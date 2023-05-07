require 'rails_helper'

describe 'Usuário informa novo status de pedido' do
  it 'e pedido foi entregue' do
    user = User.create!(email: 'joao@email.com', password: '171653', name: 'João')
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')
    supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')

    product = ProductModel.create!(supplier:, name: 'Cadeira Gamer', weight: 5, height: 100,
                                   width: 70, depth: 75, sku: 'CADEIRAGAMER001')
    order = Order.create!(user:, warehouse:, supplier:,
                          estimated_delivery_date: 1.day.from_now, status: 'pending')
    OrderItem.create!(order:, product_model: product, quantity: 5)

    login_as(user)
    visit root_path
    click_on 'Meus Pedidos'
    click_on order.code
    click_on 'Marcar como Entregue'

    expect(current_path).to eq order_path(order.id)
    expect(page).to have_content 'Situação do Pedido: Entregue'
    expect(page).not_to have_button 'Marcar como Cancelado'
    expect(page).not_to have_button 'Marcar como Entregue'
    expect(StockProduct.count).to eq 5
    estoque = StockProduct.where(product_model: product, warehouse:).count
    expect(estoque).to eq 5
  end

  it 'e pedido foi cancelado' do
    user = User.create!(email: 'joao@email.com', password: '171653', name: 'João')
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')
    supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
    order = Order.create!(user:, warehouse:, supplier:,
                          estimated_delivery_date: 1.day.from_now, status: 'pending')
    product = ProductModel.create!(supplier:, name: 'Cadeira Gamer', weight: 5, height: 100,
                                   width: 70, depth: 75, sku: 'CADEIRAGAMER001')
    OrderItem.create!(order:, product_model: product, quantity: 5)

    login_as(user)
    visit root_path
    click_on 'Meus Pedidos'
    click_on order.code
    click_on 'Marcar como Cancelado'

    expect(current_path).to eq order_path(order.id)
    expect(page).to have_content 'Situação do Pedido: Cancelado'
    expect(StockProduct.count).to eq 0
  end
end
