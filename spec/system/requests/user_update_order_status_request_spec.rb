require 'rails_helper'

describe 'Usuário atualiza o status de um pedido' do
  context 'status delivered' do
    it 'e não é o dono' do
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
      post(delivered_order_path(order.id))

      expect(response).to redirect_to(root_path)
    end

    it 'não estando logado' do
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

      post(delivered_order_path(order.id))

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context 'status canceled' do
    it 'não estando logado' do
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

      post(canceled_order_path(order.id))

      expect(response).to redirect_to(new_user_session_path)
    end

    it 'e não é o dono' do
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
      post(canceled_order_path(order.id))

      expect(response).to redirect_to(root_path)
    end
  end
end
