class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name, :unique => true
      t.string :profile_url
      t.references :pokemon, foreign_key: true, :null => true, on_delete: :nullify
      t.timestamps
    end
    add_index :pokemons, :name, unique: true
  end
end
