class Merchant
  attr_reader :id, :name

  def initialize(data)
    # require 'pry'; binding.pry
    @id = data[:id]
    @name = data[:attributes][:name]
  end
end