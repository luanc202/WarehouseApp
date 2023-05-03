require 'rails_helper'

describe 'Usuário vê modelos de produtos' do

  it 'se estiver autenticado' do
     visit root_path
      within 'nav' do
        click_on 'Modelos de Produtos'
      end

      expect(current_path).to eq new_user_session_path
  end

  it 'a partir do menu' do
    user = User.create!(email: 'joao@email.com', password: '171653', name: 'João')

    visit root_path
    login_as(user)
    within 'nav' do
      click_on 'Modelos de Produtos'
    end

    expect(current_path).to eq product_models_path
  end

  it 'com sucesso' do
    user = User.create!(email: 'joao@email.com', password: '171653', name: 'João')
    supplier = Supplier.create!(corporate_name: 'Samsung Electronics Brasil Co.', brand_name: 'Samsung', registration_number: '73563216000102',
                                full_address: 'Av dos Smartphones, X43', city: 'Marília', state: 'SP', email: 'contato@samsung.sac.com')
    ProductModel.create!(name: 'TV 32', weight: 8000, width: 70, height: 45, depth: 10, sku: 'TV32-SAMSU-BTV800',
                         supplier:)
    ProductModel.create!(name: 'SoundBar 7.1 UltraSurround', weight: 3000, width: 80, height: 15, depth: 20, sku: 'SDB55-SAMS-JKL3523',
                         supplier:)

    visit root_path
    login_as(user)
    within 'nav' do
      click_on 'Modelos de Produtos'
    end

    expect(page).to have_content('TV 32')
    expect(page).to have_content('TV32-SAMSU-BTV800')
    expect(page).to have_content('Samsung')
    expect(page).to have_content('SoundBar 7.1 UltraSurround')
    expect(page).to have_content('SDB55-SAMS-JKL3523')
    expect(page).to have_content('Samsung')
  end

  it 'e não existem produtos cadastrados' do
    user = User.create!(email: 'joao@email.com', password: '171653', name: 'João')

    visit root_path
    login_as(user)
    within 'nav' do
      click_on 'Modelos de Produtos'
    end

    expect(page).to have_content('Nenhum modelo de produto cadastrado')
  end
end
