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
                                estimated_delivery_date: 1.day.from_now)
    second_order = Order.create!(user:other_user, warehouse:, supplier:,
      estimated_delivery_date: 1.day.from_now)
    third_order = Order.create!(user:, warehouse:, supplier:,
      estimated_delivery_date: 1.day.from_now)

      login_as(user)
      visit root_path
      click_on 'Meus Pedidos'

      expect(page).to have_content first_order.code
      expect(page).not_to have_content second_order.code
      expect(page).to have_content third_order.code
  end
end
