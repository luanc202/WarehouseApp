require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'false when name is empty' do
        # Arrange
        warehouse = Warehouse.new(name: '', code: 'RIO', address: 'Rua do Rio, 123', cep: '12345-123', city: 'Rio',
                                  area: 1000, description: 'Alguma descrição')
        # Act
        # result = warehouse.valid?
        # Assert
        # expect(result).to be_falsey

        expect(warehouse).to_not be_valid
      end

      it 'false when code is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: '', address: 'Rua do Rio, 123', cep: '12345-123', city: 'Rio',
                                  area: 1000, description: 'Alguma descrição')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to be_falsey
      end

      it 'false when address is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: '', cep: '12345-123', city: 'Rio',
                                  area: 1000, description: 'Alguma descrição')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to be_falsey
      end
    end

    it 'false when code is not unique' do
      # Arrange
      first_warehouse = Warehouse.create(name: 'Rio', code: 'RIO', address: 'Rua do Rio, 123', cep: '12345-123', city: 'Rio',
                                         area: 1000, description: 'Alguma descrição')
      second_warehouse = Warehouse.new(name: 'Niteroi', code: 'RIO', address: 'Avenida', cep: '35000-123', city: 'Niterói',
                                       area: 1500, description: 'Outra descrição')
      # Act
      result = second_warehouse.valid?
      # Assert
      expect(result).to be_falsey
    end
  end
end
