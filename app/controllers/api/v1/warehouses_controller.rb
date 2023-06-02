class Api::V1::WarehousesController < ApplicationController
  rescue_from ActiveRecord::ActiveRecordError, with: :return_500
  rescue_from ActiveRecord::RecordNotFound, with: :return_404

  def show
    warehouse = Warehouse.find(params[:id])
    render status: 200, json: warehouse.as_json(except: %i[created_at updated_at])
  rescue StandardError
    render status: 404, json: { message: 'Not Found' }
  end

  def index
    warehouses = Warehouse.all.order(:name)
    render status: 200, json: warehouses
  end

  def create
    warehouse_params = params.require(:warehouse).permit(:name, :code, :city, :area, :address, :cep, :description)
    warehouse = Warehouse.new(warehouse_params)
    if warehouse.save
      render status: 201, json: warehouse
    else
      render status: 412, json: { errors: warehouse.errors.full_messages }
    end
  end

  private

  def return_500
    render status: 500, json: { message: 'Erro interno no servidor' }
  end

  def return_404
    render status: 404, json: { message: 'Not Found' }
  end
end
