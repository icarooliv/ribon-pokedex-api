require 'test_helper'

class PokemonTest < ActiveSupport::TestCase
  
  # test "should save pokemon" do
  #   pokemon = pokemons(:pikachu)
  #   assert pokemon.save, "Not saved pokemon"
  # end
  
  # test "should not save empty body" do
  #   pokemon = Pokemon::new()
  #   assert_not pokemon.save, "Saved pokemon with empty body"
  # end

  # test "should save pokemon with existent evolves_from fk" do
  #   pokemon = pokemons(:raichu)
  #   pokemon.evolutions << pokemons(:pikachu)
  #   assert pokemon.save, "Not saved pokemon with existent evolves_from fk"
  # end

  # test "should save pokemon with nullable evolves_from" do
  #   pokemon = Pokemon::new(evolves_from: :nil, sprite_front_url: 'www.url.com', name: 'Pikachu' )
  #   assert pokemon.save, "Not saved pokemon with empty evolves from"
  # end

  # test "should not save pokemon with unexistent ancestor fk" do
  #   pokemon = pokemons(:charmander)
  #   pokemon.evolves_from =  0
  #   assert_not pokemon.save, "Saved pokemon with unexistent evolves_from fk"
  # end

  # test "should not save pokemon with unexistent type" do
  #   pokemon = pokemons(:bulbasaur)
  #   assert_not pokemon.save, "Saved pokemon with unexistent type fk"
  # end
end
