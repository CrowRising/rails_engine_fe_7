# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MerchantService do
  it 'establishes a connection to the merchants' do
    stubbed_response = File.read('spec/fixtures/merchant_data.json')
    stub_request(:get, 'http://localhost:3000/api/v1/merchants')
      .to_return(status: 200, body: stubbed_response)

    get_merchant = MerchantService.new.get_merchants

    expect(get_merchant).to be_a Hash
    expect(get_merchant).to have_key :data
    expect(get_merchant[:data]).to be_an Array

    get_merchant[:data].each do |merchant|
      expect(merchant).to have_key :id
      expect(merchant[:id]).to be_a String
      expect(merchant).to have_key :type
      expect(merchant[:type]).to be_a String
      expect(merchant).to have_key :attributes
      expect(merchant[:attributes]).to be_a Hash
      expect(merchant[:attributes]).to have_key :name
      expect(merchant[:attributes][:name]).to be_a String
    end
  end

  it 'establishes a connection to a single merchant' do
    stubbed_response = File.read('spec/fixtures/merchant_1_data.json')
    stub_request(:get, 'http://localhost:3000/api/v1/merchants/1')
      .to_return(status: 200, body: stubbed_response)

    merchant = MerchantService.new.get_merchant(1)

    expect(merchant).to be_a Hash
    expect(merchant).to have_key :data
    expect(merchant[:data]).to be_a Hash
    expect(merchant[:data]).to have_key :id
    expect(merchant[:data][:id]).to be_a String
    expect(merchant[:data]).to have_key :type
    expect(merchant[:data][:type]).to be_a String
    expect(merchant[:data]).to have_key :attributes
    expect(merchant[:data][:attributes]).to be_a Hash
    expect(merchant[:data][:attributes]).to have_key :name
    expect(merchant[:data][:attributes][:name]).to be_a String
  end

  it 'can get items for single merchant' do
    stubbed_response = File.read('spec/fixtures/merchant_1_items.json')
    stub_request(:get, 'http://localhost:3000/api/v1/merchants/1/items')
      .to_return(status: 200, body: stubbed_response)

      find_merchant_items = MerchantService.new.find_merchant_items(1)
      expect(find_merchant_items).to be_a Hash
  end
end
