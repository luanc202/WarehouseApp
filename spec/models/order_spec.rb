require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'false when warehouse_id is empty' do
        user = User.create!(email: 'joao@email.com', password: '171653', name: 'João')
        Warehouse.create!(name: 'Cuiabá', code: 'CWB', city: 'Cuiabá', area: 70_000,
                          address: 'Av das Capivaras, 143', cep: '7550-000', description: 'Galpão Central Brasileiro')
        warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                      description: 'Galpão destinado para cargas internacionais')
        supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                    full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
        order = Order.create(warehouse_id: '', supplier_id: supplier.id, user_id: user.id, estimated_delivery_date: '10/05/2023')

        result = order.valid?

        expect(result).to eq false
      end

      it 'false when supplier_id is empty' do
        user = User.create!(email: 'joao@email.com', password: '171653', name: 'João')
        Warehouse.create!(name: 'Cuiabá', code: 'CWB', city: 'Cuiabá', area: 70_000,
                          address: 'Av das Capivaras, 143', cep: '7550-000', description: 'Galpão Central Brasileiro')
        warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                      description: 'Galpão destinado para cargas internacionais')
        supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                    full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
        order = Order.create(warehouse_id: warehouse.id, supplier_id: '', user_id: user.id, estimated_delivery_date: '10/05/2023')

        result = order.valid?

        expect(result).to eq false
      end

      it 'false when user_id is empty' do
        user = User.create!(email: 'joao@email.com', password: '171653', name: 'João')
        Warehouse.create!(name: 'Cuiabá', code: 'CWB', city: 'Cuiabá', area: 70_000,
                          address: 'Av das Capivaras, 143', cep: '7550-000', description: 'Galpão Central Brasileiro')
        warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                      description: 'Galpão destinado para cargas internacionais')
        supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                    full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
        order = Order.create(warehouse_id: warehouse.id, supplier_id: supplier.id, user_id: '', estimated_delivery_date: '10/05/2023')

        result = order.valid?

        expect(result).to eq false
      end
    end
  end
end
