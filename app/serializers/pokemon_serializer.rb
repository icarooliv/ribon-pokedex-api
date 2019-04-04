class PokemonSerializer < ActiveModel::Serializer
  attributes :name, :profile_url, :types

  has_many :types
  
end
