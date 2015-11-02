class CreateSpells < ActiveRecord::Migration
  def change
    create_table :spells do |t|
      t.integer :champion_id
      t.string :name
      t.string :description
      t.string :cost
      t.string :cooldown
      t.string :range
      t.string :key
      t.timestamps null: false
    end
  end
end
