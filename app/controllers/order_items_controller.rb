class OrderItemsController < ApplicationController
  
  def new
    @order = Order.find(params[:order_id])
    @products = @order.supplier.product_models

    @order_item = OrderItem.new
  end

  def create
    @order = Order.find(params[:order_id])
    order_item_params = params.require(:order_item).permit(:quantity, :product_model_id)
    @order.order_items.create(order_item_params)
    if @order.save
      redirect_to @order, notice: 'Item adicionado com sucesso'
    else
      @products = ProductModel.where(supplier: @order.supplier)
      render :new
    end
  end
end