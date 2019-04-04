class CreateJoinTablePokemonType < ActiveRecord::Migration[5.2]
  def change
    create_join_table :pokemons, :types do |t|
      t.index [:pokemon_id]
      t.index [:type_id]  
      t.index [:pokemon_id, :type_id], :unique => true
    end
    add_foreign_key :pokemons_types, :pokemons, on_delete: :cascade
    add_foreign_key :pokemons_types, :types, on_delete: :cascade
  end
end
