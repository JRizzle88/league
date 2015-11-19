class CreateSummoners < ActiveRecord::Migration
  def change
    create_table :summoners do |t|
      t.string :name
      t.integer :icon
      t.integer :level
      t.timestamps null: false
    end
  end
end
