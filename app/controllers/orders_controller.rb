class OrdersController < ApplicationController
  before_action :authenticate_user!
  def new
    @order = Order.new
    @warehouses = Warehouse.all
    @suppliers = Supplier.all
  end

  def create
    order_params = params.require(:order).permit(:estimated_delivery_date, :warehouse_id, :supplier_id)
    @order = Order.new(order_params)
    @order.user = current_user
     if @order.save
      redirect_to @order, notice: 'Pedido registrado com sucesso'
     else
      @warehouses = Warehouse.all
      @suppliers = Supplier.all
      flash.now[:alert] = 'Não foi possível registrar o pedido.'
      render :new
     end
  end

  def show
    @order = Order.find(params[:id])
  end

  def search
    @code = params[:query]
    @orders = Order.where("code LIKE ?", "%#{@code}%")
  end

  def index
    @orders = current_user.orders
  end
end
