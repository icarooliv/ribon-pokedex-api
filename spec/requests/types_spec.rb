require 'rails_helper'

RSpec.describe 'Pokemons API', type: :request do
  # initialize test data 
  let!(:types) { create_list(:type, 10) }
  let(:type_id) { types.first.id }

  # Test suite for GET /types
  describe 'GET /api/v1/types' do
    # make HTTP get request before each example
    before { get '/api/v1/types' }

    it 'returns types' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
