class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order_and_check_user, only: %i[show edit update delivered canceled]

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
    return unless @order.user != current_user

    redirect_to root_path, alert: 'Você não tem permissão para acessar essa página.'
  end

  def search
    @code = params[:query]
    @orders = Order.where('code LIKE ?', "%#{@code}%")
  end

  def index
    @orders = current_user.orders
  end

  def edit
    @warehouses = Warehouse.all
    @suppliers = Supplier.all
  end

  def update
    order_params = params.require(:order).permit(:estimated_delivery_date, :warehouse_id, :supplier_id)

    if @order.update(order_params)
      redirect_to @order, notice: 'Pedido atualizado com sucesso'
    else
      flash.now[:alert] = 'Não foi possível atualizar o pedido.'
      render :edit
    end
  end

  def delivered
    @order.delivered!
    redirect_to @order
  end

  def canceled
    @order.canceled!
    redirect_to @order
  end

  private

  def set_order_and_check_user
    @order = Order.find(params[:id])
    return unless @order.user != current_user

    redirect_to root_path, alert: 'Você não tem permissão para acessar essa página.'
  end
end
