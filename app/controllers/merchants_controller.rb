class MerchantsController < ApplicationController

  def index
    @merchants = MerchantsFacade.new.merchants
  end

  def show
    @merchant = MerchantFacade.new(params[:id]).merchant
    # require 'pry'; binding.pry
  end
end