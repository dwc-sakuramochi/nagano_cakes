class Public::HomesController < ApplicationController
  def top
    @items = Item.order('id DESC').limit(4)
    @item = Item.new

  end

  def about
  end

end
