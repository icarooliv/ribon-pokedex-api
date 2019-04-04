class CreateJoinTablePokemonType < ActiveRecord::Migration[5.2]
  def change
    create_join_table :pokemons, :types do |t|
      t.index [:pokemon_id, :type_id]
      t.index [:type_id, :pokemon_id]
    end
    add_foreign_key :pokemons_types, :pokemons
    add_foreign_key :pokemons_types, :types
  end
end
