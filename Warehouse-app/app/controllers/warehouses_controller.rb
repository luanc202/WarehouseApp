class WarehousesController < ApplicationController
  def show
    id = params[:id]
    @warehouse = Warehouse.find(id)
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    warehouse_params = params.require(:warehouse).permit(:name, :code, :city, :area, :address, :cep, :description)
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      redirect_to root_path, notice: 'Galpão cadastrado com sucesso.'
    else
      flash.now[:notice] = 'Galpão não cadastrado.'
      render 'new'
    end
  end
  
  def edit
    id = params[:id]
    @warehouse = Warehouse.find(id)
  end

  def update
    warehouse_params = params.require(:warehouse).permit(:name, :code, :city, :area, :address, :cep, :description)
    id = params[:id]
    @warehouse = Warehouse.find(id)
    if @warehouse.update(warehouse_params)
      redirect_to @warehouse, notice: 'Galpão atualizado com sucesso.'
    else
      flash.now[:notice] = 'Não foi possível atualizar Galpão.'
      render 'edit'
    end
  end
end
