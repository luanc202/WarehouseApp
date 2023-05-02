class ProductModelsController < ApplicationController
  def index
    @product_models = ProductModel.all
  end

  def new
    @product_model = ProductModel.new
  end

  def show
    @product_model = ProductModel.find(params[:id])
  end

  def create
    product_model_params = params.require(:product_model).permit(:name, :weight, :width, :height, :depth, :sku, :supplier_id)

    @product_model = ProductModel.new(product_model_params)
    if @product_model.save
      redirect_to @product_model
    else
      render :new
    end
  end
end
