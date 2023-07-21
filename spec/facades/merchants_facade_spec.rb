require 'rails_helper'
 RSpec.describe MerchantsFacade do
  describe ' merchants' do
    before :each do
      stubbed_response = File.read('spec/fixtures/merchant_data.json')
      stub_request(:get,"http://localhost3000/api/v1/merchants")
      .to_return(status: 200, body: stubbed_response)
    end

    it 'exists', :vcr do
      merchants = MerchantsFacade.new
      expect(merchants).to be_a(MerchantsFacade)

      expect(merchants.merchants).to be_an(Array)
      expect(merchants.merchants.count).to eq(100)
      expect(merchants.merchants.first).to be_a(Merchant)
      expect(merchants.merchants.first.id).to be_a(String)
    end
  end
 end