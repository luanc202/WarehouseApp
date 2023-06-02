require 'rails_helper'

describe 'Warehouse API' do
  context 'GET /api/v1/warehouses/1' do
    it 'success' do
      warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                    address: 'Avenida do Aeroporto, 1000', cep: '15000-000', description: 'Galpão destinado para cargas internacionais')

      get "/api/v1/warehouses/#{warehouse.id}"

      expect(response).to have_http_status(200)
      expect(response.content_type).to include 'application/json'

      json_repsonse = JSON.parse(response.body, symbolize_names: true)

      expect(json_repsonse[:name]).to eq warehouse.name
      expect(json_repsonse[:code]).to eq warehouse.code
      expect(json_repsonse.keys).not_to include :created_at
      expect(json_repsonse.keys).not_to include :updated_at
    end

    it 'fail if warehouse not found' do
      get '/api/v1/warehouses/999'

      expect(response).to have_http_status(404)
      expect(response.content_type).to include 'application/json'

      json_repsonse = JSON.parse(response.body, symbolize_names: true)

      expect(json_repsonse[:message]).to eq 'Not Found'
    end
  end

  context 'GET /api/v1/warehouses' do
    it 'list all warehouse ordered by name' do
      warehouse_one = Warehouse.create!(name: 'Galpão SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                        address: 'Avenida do Aeroporto, 1000', cep: '15000-000', description: 'Galpão destinado para cargas internacionais')

      warehouse_two = Warehouse.create!(name: 'Aeroporto RJ', code: 'GIG', city: 'Rio de Janeiro', area: 200_000,
                                        address: 'Avenida do Aeroporto, 2000', cep: '20000-000', description: 'Galpão destinado para cargas internacionais')

      get '/api/v1/warehouses'

      expect(response).to have_http_status(200)
      expect(response.content_type).to include 'application/json'

      json_repsonse = JSON.parse(response.body)

      expect(json_repsonse.class).to eq Array
      expect(json_repsonse.length).to eq 2
      expect(json_repsonse[0]['name']).to eq 'Aeroporto RJ'
      expect(json_repsonse[1]['name']).to eq 'Galpão SP'
    end

    it 'return empty if there is no warehouse' do
      get '/api/v1/warehouses'

      expect(response).to have_http_status(200)
      expect(response.content_type).to include 'application/json'

      json_repsonse = JSON.parse(response.body)

      expect(json_repsonse.class).to eq Array
      expect(json_repsonse.length).to eq 0
    end

    it 'and raise internal error' do
      allow(Warehouse).to receive(:all).and_raise(ActiveRecord::QueryCanceled)

      get '/api/v1/warehouses'

      expect(response).to have_http_status(500)
    end
  end

  context 'POST /api/v1/warehouses' do
    it 'success' do
      warehouse_params = { warehouse: { name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                        address: 'Avenida do Aeroporto, 1000', cep: '15000-000', description: 'Galpão destinado para cargas internacionais' } }

      post '/api/v1/warehouses', params: warehouse_params

      expect(response).to have_http_status(:created)
      expect(response.content_type).to include 'application/json'
      json_repsonse = JSON.parse(response.body, symbolize_names: true)
      expect(json_repsonse[:name]).to eq('Aeroporto SP')
      expect(json_repsonse[:code]).to eq('GRU')
      expect(json_repsonse[:city]).to eq('Guarulhos')
      expect(json_repsonse[:area]).to eq(100_000)
      expect(json_repsonse[:address]).to eq('Avenida do Aeroporto, 1000')
      expect(json_repsonse[:cep]).to eq('15000-000')
      expect(json_repsonse[:description]).to eq('Galpão destinado para cargas internacionais')
    end

    it 'fail if parameters are not complete' do
      warehouse_params = { warehouse: { name: 'Aeroporto SP', code: 'GRU', area: 100_000,
                                        cep: '15000-000' } }

      post '/api/v1/warehouses', params: warehouse_params

      expect(response).to have_http_status(412)
      expect(response.content_type).to include 'application/json'
      expect(response.body).not_to include 'Nome não pode ficar em branco'
      expect(response.body).not_to include 'Código não pode ficar em branco'
      expect(response.body).to include 'Cidade não pode ficar em branco'
      expect(response.body).to include 'Endereço não pode ficar em branco'
    end

    it 'fail if there is an internal error' do
      warehouse_params = { warehouse: { name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                        address: 'Avenida do Aeroporto, 1000', cep: '15000-000', description: 'Galpão destinado para cargas internacionais' } }

      allow(Warehouse).to receive(:new).and_raise(ActiveRecord::ActiveRecordError)

      post '/api/v1/warehouses', params: warehouse_params

      expect(response).to have_http_status(500)
      expect(response.content_type).to include 'application/json'
      expect(response.body).to include 'Erro interno no servidor'
    end
  end
end
