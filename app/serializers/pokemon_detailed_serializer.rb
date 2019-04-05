class PokemonDetailedSerializer < ActiveModel::Serializer
  attributes :id, :name, :sprite_front_url, :api_url, :types, :evolves_from, :evolutions 

  has_many :evolutions 
  has_many :types
  
  def evolutions
    object.evolutions.map do |evolution|
      ::PokemonDetailedSerializer.new(evolution).attributes
    end
  end

  def types
    object.types.map do |type|
      ::TypeSerializer.new(type).attributes
    end
  end

end
