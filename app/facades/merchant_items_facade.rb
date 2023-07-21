class MerchantItemsFacade
  def self.get_items
    MerchantItemsService.new.get_items[:data].map do |item_data|
      MerchantItem.new(item_data)
    end
  end

  def self.find_items(id)
    MerchantItemsService.new.find_items(id)[:data]
  end
end