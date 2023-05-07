require 'rails_helper'

describe 'Usuário vê o estoque na tela do galpão' do
  it 'na tela do galpão' do
    user = User.create!(email: 'joao@email.com', password: '171653', name: 'João')
    warehouse = Warehouse.new(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')
    supplier = Supplier.create!(corporate_name: 'Spark Industries Brasil LTDA', brand_name: 'Spark', registration_number: '624452333400043',
                                full_address: 'Distrito Industrial N33, Bloco 4B', city: 'Teresina', state: 'PI', email: 'contato@sparkindustries.com')
    product_tv = ProductModel.create!(name: 'TV 32', weight: 8000, width: 70, height: 45, depth: 10, sku: 'TV32-SAMSU-BTV800',
                                      supplier:)
    product_soundbar = ProductModel.create!(name: 'SoundBar 7.1 UltraSurround', weight: 3000, width: 80, height: 15, depth: 20, sku: 'SDB55-SAMS-JKL3523',
                                            supplier:)
    product_laptop = ProductModel.create!(name: 'Zenith R7 16GB RAM', weight: 1000, width: 50, height: 8, depth: 35, sku: 'ZNT-R7-16GB-1TB',
                                          supplier:)
    order = Order.create!(user:, warehouse:, supplier:,
                          estimated_delivery_date: 1.week.from_now)

    3.times { StockProduct.create!(order:, warehouse:, product_model: product_tv) }
    2.times { StockProduct.create!(order:, warehouse:, product_model: product_soundbar) }

    login_as(user)
    visit root_path
    click_on 'Aeroporto SP'

    expect(page).to have_content('Itens em Estoque')
    expect(page).to have_content('3 x TV32-SAMSU-BTV800')
    expect(page).to have_content('2 x SDB55-SAMS-JKL3523')
    expect(page).not_to have_content('ZNT-R7-16GB-1TB')
  end
end
