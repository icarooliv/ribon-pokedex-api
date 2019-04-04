class PokemonSerializer < ActiveModel::Serializer
  attributes :id, :name, :profile_url, :types

  has_many :types
  
end
