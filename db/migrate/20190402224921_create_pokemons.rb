class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name, :unique => true
      t.string :sprite_front_url
      t.string :api_url
      t.references :pokemon, foreign_key: {to_table: :pokemons, :null => true, on_delete: :nullify}
      t.timestamps
    end
    add_index :pokemons, :name, unique: true
  end
end
