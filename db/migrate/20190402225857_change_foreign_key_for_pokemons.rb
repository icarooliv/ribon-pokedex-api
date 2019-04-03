class ChangeForeignKeyForPokemons < ActiveRecord::Migration[5.2]
  def change
     rename_column :pokemons, :pokemon_id, :evolves_from
     change_column_null :pokemons, :evolves_from, true
  end
end
