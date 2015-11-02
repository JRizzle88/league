class CreateChampions < ActiveRecord::Migration
  def change
    create_table :champions do |t|
      t.string :champion_id
      t.boolean :active
      t.boolean :free
      t.boolean :ranked
      t.timestamps null: false
    end
  end
end
