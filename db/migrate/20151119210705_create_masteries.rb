class CreateMasteries < ActiveRecord::Migration
  def change
    create_table :masteries do |t|
      t.timestamps null: false
    end
  end
end
