class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show]

  def index
    @suppliers = Supplier.all
  end

  def show
    set_supplier
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end
end
