class ItemsController < ApplicationController
  def index
    @items = Item.all

    render json: @items
  end

  def show
    @item = Item.find(params[:id])

    render json: @item
  end

  def create
    @item = Item.create(
  name: params[:name],
  price: params[:price],
  supplier_id: params[:supplier_id]
  )

      render json: @item
  end

  def update
    @item = Item.find(params[:id])

    @item.update(
      name: params[:name] || @item.name,
      price: params[:price] || @item.price,
      supplier_id: params[:supplier_id]  || @item.supplier_id
    )

    render json: @item
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    render json: { message: "Item successfully deleted!" }
  end
end
