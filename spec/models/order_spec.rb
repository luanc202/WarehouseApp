require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'gera um código aleatório' do
    it 'ao criar um novo pedido' do
      user = User.create!(email: 'joao@email.com', password: '171653', name: 'João')
      warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                    address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                    description: 'Galpão destinado para cargas internacionais')
      supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                  full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
      order = Order.create!(warehouse:, supplier:,
                            user:, estimated_delivery_date: '10/05/2023')

      order.save!
      result = order.code

      expect(result).not_to be_empty
      expect(result.length).to eq 8
    end

    it 'e o código é único' do
      user = User.create!(email: 'joao@email.com', password: '171653', name: 'João')
      warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                    address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                    description: 'Galpão destinado para cargas internacionais')
      supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                  full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
      first_order = Order.create!(warehouse:, supplier:,
                                  user:, estimated_delivery_date: '10/05/2023')
      second_order = Order.new(warehouse:, supplier:,
                               user:, estimated_delivery_date: '12/05/2023')

      second_order.save!

      expect(second_order.code).not_to eq first_order.code
    end
  end
  describe '#valid?' do
    it 'deve ter um código' do
      user = User.create!(email: 'joao@email.com', password: '171653', name: 'João')
      warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                    address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                    description: 'Galpão destinado para cargas internacionais')
      supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                  full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
      order = Order.new(warehouse:, supplier:, user:,
                        estimated_delivery_date: '10/05/2023')

      result = order.valid?

      expect(result).to be true
    end
    context 'presence' do
      it 'warehouse_id é obrigatório' do
        user = User.create!(email: 'joao@email.com', password: '171653', name: 'João')
        Warehouse.create!(name: 'Cuiabá', code: 'CWB', city: 'Cuiabá', area: 70_000,
                          address: 'Av das Capivaras, 143', cep: '7550-000', description: 'Galpão Central Brasileiro')
        warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                      description: 'Galpão destinado para cargas internacionais')
        supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                    full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
        order = Order.create(warehouse_id: '', supplier_id: supplier.id, user_id: user.id,
                             estimated_delivery_date: '10/05/2023')

        result = order.valid?

        expect(result).to eq false
      end

      it 'supplier_id é obrigatório' do
        user = User.create!(email: 'joao@email.com', password: '171653', name: 'João')
        Warehouse.create!(name: 'Cuiabá', code: 'CWB', city: 'Cuiabá', area: 70_000,
                          address: 'Av das Capivaras, 143', cep: '7550-000', description: 'Galpão Central Brasileiro')
        warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                      description: 'Galpão destinado para cargas internacionais')
        supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                    full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
        order = Order.create(warehouse_id: warehouse.id, supplier_id: '', user_id: user.id,
                             estimated_delivery_date: '10/05/2023')

        result = order.valid?

        expect(result).to eq false
      end

      it 'user_id é obrigatório' do
        user = User.create!(email: 'joao@email.com', password: '171653', name: 'João')
        Warehouse.create!(name: 'Cuiabá', code: 'CWB', city: 'Cuiabá', area: 70_000,
                          address: 'Av das Capivaras, 143', cep: '7550-000', description: 'Galpão Central Brasileiro')
        warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                      description: 'Galpão destinado para cargas internacionais')
        supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                    full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
        order = Order.create(warehouse_id: warehouse.id, supplier_id: supplier.id, user_id: '',
                             estimated_delivery_date: '10/05/2023')

        result = order.valid?

        expect(result).to eq false
      end

      it 'estimated_delivery_date é obrigatório' do
        order = Order.new(estimated_delivery_date: '')

        order.valid?
        result = order.errors.include?(:estimated_delivery_date)

        expect(result).to eq true
      end

      it 'data estimada de entrega não deve ser passada' do
        order = Order.new(estimated_delivery_date: 1.day.ago)

        order.valid?

        expect(order.errors.include?(:estimated_delivery_date)).to eq true
        expect(order.errors[:estimated_delivery_date]).to include('deve ser futura')
      end

      it 'data estimada de entrega não deve ser igual a hoje' do
        order = Order.new(estimated_delivery_date: Date.today)

        order.valid?

        expect(order.errors.include?(:estimated_delivery_date)).to eq true
        expect(order.errors[:estimated_delivery_date]).to include('deve ser futura')
      end

      it 'data estimada de entrega deve igual ou maior do que amanhã' do
        order = Order.new(estimated_delivery_date: 1.day.from_now)

        order.valid?

        expect(order.errors.include?(:estimated_delivery_date)).to eq false
      end
    end
  end
end
