require 'rails_helper'

RSpec.describe 'Merchants show page' do
  describe 'As a visitor' do
    it 'displays merchant name and items', :vcr do
      json_response = File.read('spec/fixtures/merchant_1_data.json')
      stub_request(:get, 'http://localhost:3000/api/v1/merchants/1')
        .to_return(status: 200, body: json_response)

      json_response = File.read('spec/fixtures/merchant_1_items.json')
      stub_request(:get, 'http://localhost:3000/api/v1/merchants/1/items')
        .to_return(status: 200, body: json_response)

      visit merchant_path(1)

      within '#merchant_items' do

        expect(page).to have_content('Schroeder-Jerde')
        expect(page).to have_content('Item 1')
        expect(page).to have_content('Item 2')
        expect(page).to have_content('Item 3')
        expect(page).to have_content('Item 4')
        expect(page).to have_content('Item 5')
        expect(page).to have_content('Item 6')
        expect(page).to have_content('Item 7')
        expect(page).to have_content('Item 8')
        expect(page).to have_content('Item 9')
        expect(page).to have_content('Item 10')
      end
    end
  end
end