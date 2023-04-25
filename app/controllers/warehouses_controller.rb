class WarehousesController < ApplicationController
  def show
    id = params[:id]
    @warehouse = Warehouse.find(id)
  end

  def new; end

  def create
    warehouse_params = params.require(:warehouse).permit(:name, :code, :city, :area, :address, :cep, :description)
    w = Warehouse.create(warehouse_params)
    w.save()

    flash[:notice] = 'Galpão cadastrado com sucesso'
    redirect_to root_path
  end
end
