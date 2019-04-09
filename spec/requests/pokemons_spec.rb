require 'rails_helper'

RSpec.describe 'Pokemons API', type: :request do
  # initialize test data 
  let!(:pokemons) { create_list(:pokemon, 10) }
  let(:pokemon_id) { pokemons.first.id }

  # Test suite for GET /pokemons
  describe 'GET /api/v1/pokemons' do
    # make HTTP get request before each example
    before { get '/api/v1/pokemons' }

    it 'returns pokemons' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
