require 'rails_helper'

RSpec.describe StockProduct, type: :model do
  describe 'gera um número de série aleatório' do
    it 'ao criar um StockProduct' do
      user = User.create!(email: 'joao@email.com', password: '171653', name: 'João')
      warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                    address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                    description: 'Galpão destinado para cargas internacionais')
      supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                  full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
      order = Order.create!(warehouse:, supplier:,
                            user:, estimated_delivery_date: 1.week.from_now)
      product = ProductModel.create!(supplier:, name: 'Cadeira Gamer', weight: 5, height: 100,
                                     width: 70, depth: 75, sku: 'CADEIRAGAMER001')

      stock_product = StockProduct.create!(order:, warehouse:, product_model: product)

      expect(stock_product.serial_number.length).to eq 20
    end

    it 'e não é modificado' do
      user = User.create!(email: 'joao@email.com', password: '171653', name: 'João')
      warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                    address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                    description: 'Galpão destinado para cargas internacionais')
      warehouse_two = Warehouse.create!(name: 'Cuiabá', code: 'CWB', city: 'Cuiabá', area: 70_000,
                                        address: 'Av das Capivaras, 143', cep: '7550-000', description: 'Galpão Central Brasileiro')
      supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                  full_address: 'Av da Palmas, 123', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
      order = Order.create!(warehouse:, supplier:,
                            user:, estimated_delivery_date: 1.week.from_now)
      product = ProductModel.create!(supplier:, name: 'Cadeira Gamer', weight: 5, height: 100,
                                     width: 70, depth: 75, sku: 'CADEIRAGAMER001')
      stock_product = StockProduct.create!(order:, warehouse:, product_model: product)
      original_serial_number = stock_product.serial_number

      stock_product.update!(warehouse: warehouse_two)

      expect(stock_product.serial_number).to eq original_serial_number
    end
  end
end
