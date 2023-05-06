require 'rails_helper'

describe 'Usuário vê seus próprios pedidos' do
  it 'e deve estar autenticado' do
    visit root_path

    click_on 'Meus Pedidos'

    expect(current_path).to eq new_user_session_path
  end

  it 'e não vê outros pedidos' do
    user = User.create!(name: 'João', email: 'joao@mail.com', password: '123456')
    other_user = User.create!(name: 'Paulo', email: 'paulo@bol.anc', password: '@h523%R@#B')
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')
    second_warehouse = Warehouse.create!(name: 'Aeroporto Rio', code: 'SDU', city: 'Rio de Janeiro', area: 80_000,
                                         address: 'Avenida do Porto, 8674', cep: '87400-000',
                                         description: 'Galpão destinado para cargas internacionais')
    supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
    first_order = Order.create!(user:, warehouse:, supplier:,
                                estimated_delivery_date: 1.day.from_now, status: 'pending')
    second_order = Order.create!(user: other_user, warehouse:, supplier:,
                                 estimated_delivery_date: 1.day.from_now, status: 'delivered')
    third_order = Order.create!(user:, warehouse:, supplier:,
                                estimated_delivery_date: 1.day.from_now, status: 'canceled')

    login_as(user)
    visit root_path
    click_on 'Meus Pedidos'

    expect(page).to have_content first_order.code
    expect(page).to have_content 'Pendente'
    expect(page).not_to have_content second_order.code
    expect(page).not_to have_content 'Entregue'
    expect(page).to have_content third_order.code
    expect(page).to have_content 'Cancelado'
  end

  it 'e visita um pedido' do
    user = User.create!(name: 'João', email: 'joao@mail.com', password: '123456')
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')
    supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
    first_order = Order.create!(user:, warehouse:, supplier:,
                                estimated_delivery_date: 1.day.from_now)

    login_as(user)
    visit root_path
    click_on 'Meus Pedidos'
    click_on first_order.code

    expect(page).to have_content 'Detalhes do Pedido'
    expect(page).to have_content first_order.code
    expect(page).to have_content 'Galpão Destino: GRU - Aeroporto SP'
    expect(page).to have_content 'Fornecedor: ACME LTDA'
    expect(page).to have_content "Data Prevista de Entrega: #{I18n.l(first_order.estimated_delivery_date)}"
  end

  it 'e não visita pedidos de outros usuários' do
    user = User.create!(name: 'João', email: 'joao@mail.com', password: '123456')
    other_user = User.create!(name: 'André', email: 'andre@mail.com', password: '!@VGWDQV')
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')
    supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
    Supplier.create!(corporate_name: 'Spark Industries Brasil LTDA', brand_name: 'Spark', registration_number: '624452333400043',
                     full_address: 'Distrito Industrial N33, Bloco 4B', city: 'Teresina', state: 'PI', email: 'contato@sparkindustries.com')
    first_order = Order.create!(user:, warehouse:, supplier:,
                                estimated_delivery_date: 1.day.from_now)

    login_as(other_user)
    visit order_path(first_order.id)

    expect(current_path).not_to eq order_path(first_order.id)
    expect(current_path).to eq root_path
    expect(page).to have_content 'Você não tem permissão para acessar essa página.'
  end
end
