class PokemonDetailedSerializer < ActiveModel::Serializer
  attributes :name, :profile_url, :types, :evolutions

  has_many :evolutions 
  has_many :types
  
  def evolutions
    object.evolutions.map do |evolution|
      ::PokemonDetailedSerializer.new(evolution).attributes
    end
  end

end
