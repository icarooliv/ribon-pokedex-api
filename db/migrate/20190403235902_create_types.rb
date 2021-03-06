class CreateTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :types do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :types, :name, unique: true
  end
end
