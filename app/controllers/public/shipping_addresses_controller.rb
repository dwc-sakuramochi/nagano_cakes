class Public::ShippingAddressesController < ApplicationController
  before_action :autheniticate_customer

  def index
    @customer = current_customer
    @shipping_addresses = @customer.shipping_addresses.all
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    if @shipping_address.save
      redirect_to request.referer
    else
      @customer = current_customer
      @shipping_addresses = @customer.shipping_addresses.all
      render :index
    end

  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      redirect_to shipping_addresses_path
    else
      render :edit
    end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    redirect_to request.referer
  end

private

  def shipping_address_params
    params.require(:shipping_address).permit(:shipping_post_code, :shipping_address, :shipping_name)
  end
end