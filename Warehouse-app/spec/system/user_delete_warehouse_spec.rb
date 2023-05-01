require 'rails_helper'

describe 'Usuário remove um galpão' do
  it 'com sucesso' do
    # Arrange
    Warehouse.create!(name: 'Cuiabá', code: 'CWB', city: 'Cuiabá', area: 70_000,
      address: 'Av das Capivaras, 143', cep: '7550-000', description: 'Galpão Central Brasileiro')

    # Act
      visit root_path
      click_on 'Cuiabá'
      click_on 'Apagar'

    # Assert
    expect(current_path).to eq(root_path)
    expect(page).to have_content('Galpão apagado com sucesso.')
    expect(page).not_to have_content('Cuiabá')
    expect(page).not_to have_content('CWB')
  end

  it 'e não apaga outros galpões' do
    # Arrange

    first_warehouse = Warehouse.create!(name: 'Cuiabá', code: 'CWB', city: 'Cuiabá', area: 70_000,
      address: 'Av das Capivaras, 143', cep: '7550-000', description: 'Galpão Central Brasileiro')
    second_warehouse = Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000,
      address: 'Avenida do Museu do Amanhã, 1000', cep: '2100-000', description: 'Galpão Rio')

      # Act
      visit root_path
      click_on 'Cuiabá'
      click_on 'Apagar'

    # Assert
    expect(current_path).to eq(root_path)
    expect(page).to have_content('Galpão apagado com sucesso.')
    expect(page).not_to have_content('Cuiabá')
    expect(page).not_to have_content('CWB')
    expect(page).to have_content('Rio')
    end
end