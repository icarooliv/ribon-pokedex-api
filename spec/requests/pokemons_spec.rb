require 'rails_helper'

RSpec.describe 'Pokemons API', type: :request do
  # initialize test data 
  let!(:pokemons) { create_list(:pokemon, 10) }
  let(:pokemon_id) { pokemons.first.id }

  let(:types) {create_list(:type, 2)}
  let(:type_id) {types.first.id}

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

    # Test suite for GET /pokemons/:id
    describe 'GET /api/v1/pokemons/:id' do
      before { get "/api/v1/pokemons/#{pokemon_id}" }
  
      context 'when the record exists' do
        it 'returns the pokemon' do
          expect(json).not_to be_empty
          expect(json['id']).to eq(pokemon_id)
        end
  
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end

      context 'when the record does not exist' do
        let(:pokemon_id) { 100 }
  
        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
  
        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find Pokemon/)
        end
      end
    end  

    describe 'POST /api/v1/pokemons' do
      # valid payload
      let(:valid_attributes) { {name: 'Agumon', sprite_front_url: 'www.digimonsdigitais.com', evolves_from: pokemons[3].id, types: type_id} }
  
      context 'when the request is valid' do
        before { post '/api/v1/pokemons', params: valid_attributes, as: :json }
        
        it 'creates a pokemon' do
          puts valid_attributes
          expect(json['name']).to eq('Agumon')
        end
  
        it 'returns status code 201' do
          expect(response).to have_http_status(201)
        end
      end
  
      context 'when the request is invalid' do
        let(:invalid_attributes) {{ name: 'Agumon2', evolves_from: 123456}}
        before { post '/api/v1/pokemons', params: invalid_attributes, as: :json }

        expected = {
          "errors"=> {
              "evolves_from"=> [
                  "A valid evolves_from is needed."
              ]
          }
        }

        it 'return error when evolves_from is invalid' do
          expect(response.parsed_body).to eq(expected)
        end

        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end
      end

      context 'when the request is a duplicate entry' do
        let(:invalid_attributes) {{ name: pokemons.first.name}}
        before { post '/api/v1/pokemons', params: invalid_attributes, as: :json }

        expected ={"errors" => {"error"=>"Duplicated unique value"}}

        it 'return error when has a duplcicate entry' do
          expect(response.parsed_body).to eq(expected)
        end
      end

      # context 'when any request is invalid' do 
      #   let(:invalid_attributes) { }
      #   before { post '/api/v1/pokemons', params: invalid_attributes, as: :json }
        
      #   expected = {"error"=> "Unprocessable entity"}

      #   it 'returns a default validation failure message' do  
      #     expect(response.parsed_body).to eq(expected)
      #   end
      # end

    end

    describe 'PUT /api/v1/pokemons/:id' do
      let(:valid_attributes) { {name: 'Pokaxo', sprite_front_url: 'www.digimonsdigitais.com', evolves_from: pokemons[3].id, types: type_id} }
  
      context 'when the record exists' do
        before { put "/api/v1/pokemons/#{pokemon_id}", params: valid_attributes, as: :json }
  
        it 'updates the record' do
          expect(json['name']).to match('Pokaxo')
        end
  
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end
    
      context 'when any request is invalid' do 
        let(:invalid_attributes) { }
        before { patch "/api/v1/pokemons/#{pokemon_id}", params: invalid_attributes, as: :json }
        
        expected = {"errors" => {"error"=>"param is missing or the value is empty: pokemon"}}

        it 'returns a default validation failure message' do
          puts response.parsed_body  
          puts expected
          expect(response.parsed_body).to eq(expected)
        end
      end
    end
  
    # Test suite for DELETE /pokemons/:id
    describe 'DELETE /api/v1/pokemons/:id' do
      before { delete "/api/v1/pokemons/#{pokemon_id}" }
  
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
end
