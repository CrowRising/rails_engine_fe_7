class MerchantFacade
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def merchant
    @_merchant ||= Merchant.new(merchant_data)
  end

  def merchant_items
    @_merchant_items ||= merchant_items_data.map do |item_data|
      MerchantItem.new(item_data)
    end
  end


  private
  
  def service
    @_service ||= MerchantService.new
  end

  def merchant_data
    @_merchant_data ||= service.get_merchant(id)[:data]
  end

  def merchant_items_data
    @_merchant_items_data ||= service.find_merchant_items(id)[:data]
  end
end