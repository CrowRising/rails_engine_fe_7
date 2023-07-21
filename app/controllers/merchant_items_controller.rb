class MerchantItemsController < ApplicationController
  
  def index
    require 'pry'; binding.pry
    @items = MerchantItemsFacade.get_items
  end

  def show
    @item = MerchantItemsFacade.find_item(params[:id])
    @merchant = MerchantsFacade.find_merchant(@item.merchant_id)
  end
end 