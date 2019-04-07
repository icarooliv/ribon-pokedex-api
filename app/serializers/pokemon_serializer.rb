class PokemonSerializer < ActiveModel::Serializer
  attributes :id, :name, :sprite_front_url, :api_url, :evolves_from
  
end
