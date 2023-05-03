require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#valid?' do
    it 'name is mandatory' do
      user = User.create(email: 'joao@email.com', password: '171653', name: '')

      result = user.valid?

      expect(result).to eq false
    end

    it 'email is mandatory' do
      user = User.create(email: '', password: '171653', name: 'João')

      result = user.valid?

      expect(result).to eq false
    end

    it 'password is mandatory' do
      user = User.create(email: 'joao@email.com', password: '', name: 'João')

      result = user.valid?

      expect(result).to eq false
    end
  end
end
