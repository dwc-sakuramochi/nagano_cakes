class Public::HomesController < ApplicationController
  def top
    @items = Item.where(sale_status: "true").order('id DESC').limit(4)
    @genres = Genre.all
  end

  def about
  end

end
