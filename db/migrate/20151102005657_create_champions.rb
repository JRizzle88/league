class CreateChampions < ActiveRecord::Migration
  def change
    create_table :champions do |t|
      t.string :name
      t.boolean :active
      t.boolean :free
      t.boolean :ranked
      t.integer :armor
      t.integer :armorperlevel
      t.integer :attackdamage
      t.integer :attackdamageperlevel
      t.integer :attackrange
      t.integer :attackspeedoffset
      t.integer :attackspeedperlevel
      t.integer :crit
      t.integer :critperlevel
      t.integer :hp
      t.integer :hpperlevel
      t.integer :hpregen
      t.integer :hpregenperlevel
      t.integer :movespeed
      t.integer :mp
      t.integer :mpperlevel
      t.integer :mpregen
      t.integer :mpregenperlevel
      t.integer :spellblock
      t.integer :spellblockperlevel
      t.timestamps null: false
    end
  end
end

# @champions_list["data"]["Thresh"]["stats"]