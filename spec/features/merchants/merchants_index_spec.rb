require 'rails_helper'

RSpec.describe 'Merchants Index Page' do
  describe 'As a visitor' do  
    before :each do
      json_response = File.read('spec/fixtures/merchant_data.json')
      stub_request(:get, 'http://localhost:3000/api/v1/merchants')
      .to_return(status: 200, body: json_response)  

      visit merchants_path
    end

    it 'I see the name of each merchant in the system', :vcr do
      within '#merchants' do
        expect(page).to have_content('Schroeder-Jerde')
        expect(page).to have_content('Klein, Rempel and Jones')
        expect(page).to have_content('Willms and Sons')
        expect(page).to have_content('Cummings-Thiel')
      end
    end

    it "merchant's name is a link", :vcr do
      within '#merchants' do
        expect(page).to have_link('Schroeder-Jerde')
        expect(page).to have_link('Klein, Rempel and Jones')
        expect(page).to have_link('Willms and Sons')
        expect(page).to have_link('Cummings-Thiel')

        click_link('Schroeder-Jerde') 
        expect(current_path).to eq(merchant_path(1))
      end
    end
  end
end