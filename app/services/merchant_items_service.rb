class MerchantItemsService 

  def get_items
    JSON.parse(conn.get.body, symbolize_names: true)  
  end

  def find_items(id)
    JSON.parse(conn.get("/api/v1/merchants/#{id}/items").body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: 'http://localhost:3000')
  end
end