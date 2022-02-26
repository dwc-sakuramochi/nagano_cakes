class Public::ItemsController < ApplicationController

  def index
    @items = Item.where(sale_status: "true").page(params[:page]).per(8)
  end

  def show
    @items = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private


end