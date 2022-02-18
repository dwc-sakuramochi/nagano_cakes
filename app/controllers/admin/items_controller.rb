class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(params_item)
    @item.save
    redirect_to admin_item_path(@item)
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  private
  
  def params_item
    params.require(:item).permit(:genre_id, :item_name, :item_explanation, :item_image, :non_taxed_price, :sale_status)
  end
end
