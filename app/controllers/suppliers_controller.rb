class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all

    render json: @suppliers
  end

  def show
    @supplier = Supplier.find(params[:id])

    render json: @supplier
  end

  def create
    @supplier = Supplier.create(
      name: params[:name]
    )

    render json: @supplier
  end

  def update
    @supplier = Supplier.find(params[:id])
    @supplier.update(
      name: params[:name] || @supplier.name
    )

    render json: @supplier
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy

    render json: { message: "Suppplier Deleted!" }
  end
end
