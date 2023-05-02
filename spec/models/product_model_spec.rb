require 'rails_helper'

RSpec.describe ProductModel, type: :model do
  describe '#valid?' do
    it 'name is mandatory' do
      supplier = Supplier.create!(corporate_name: 'Samsung Electronics Brasil Co.', brand_name: 'Samsung', registration_number: '73563216000102',
                                  full_address: 'Av dos Smartphones, X43', city: 'Marília', state: 'SP', email: 'contato@samsung.sac.com')
      pm = ProductModel.create(name: '', weight: 8000, width: 70, height: 45, depth: 10, sku: 'TV32-SAMSU-BTV800',
                               supplier:)

      result = pm.valid?

      expect(result).to eq false
    end

    it 'sku is mandatory' do
      supplier = Supplier.create!(corporate_name: 'Samsung Electronics Brasil Co.', brand_name: 'Samsung', registration_number: '73563216000102',
                                  full_address: 'Av dos Smartphones, X43', city: 'Marília', state: 'SP', email: 'contato@samsung.sac.com')
      pm = ProductModel.create(name: 'TV 40 pol', weight: 8000, width: 70, height: 45, depth: 10, sku: '',
                               supplier:)

      result = pm.valid?

      expect(result).to eq false
    end

    it 'supplier is mandatory' do
      supplier = Supplier.create!(corporate_name: 'Samsung Electronics Brasil Co.', brand_name: 'Samsung', registration_number: '73563216000102',
                                  full_address: 'Av dos Smartphones, X43', city: 'Marília', state: 'SP', email: 'contato@samsung.sac.com')
      pm = ProductModel.create(name: 'TV 40 pol', weight: 8000, width: 70, height: 45, depth: 10,
                               sku: 'TV32-SAMSU-BTV800')

      result = pm.valid?

      expect(result).to eq false
    end
  end
end
