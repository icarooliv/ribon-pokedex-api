class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :profile_url
      t.references :pokemon, foreign_key: true, :null => true, on_delete: :nullify
      t.timestamps
    end
  end
end
