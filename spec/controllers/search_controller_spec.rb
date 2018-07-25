require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe "GET #show" do
    it 'returns a success reponse' do
      VCR.use_cassette('successful get to search') do
        get :index, params: { q: 'mindfulness' }

        expect(response.code).to eq("200")
      end
    end
  end
end
