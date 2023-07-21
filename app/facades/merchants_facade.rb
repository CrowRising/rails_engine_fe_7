class MerchantsFacade
  def merchants
    @merchants ||= merchants_data.map do |merchant_data|
      Merchant.new(merchant_data)
    end
  end

  private

  def service 
    @_service ||= MerchantService.new
  end

  def merchants_data
    @_merchants_data ||= MerchantService.new.get_merchants[:data]
  end

end