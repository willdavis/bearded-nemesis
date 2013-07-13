class CreateMinerals < ActiveRecord::Migration
  def change
    create_table :minerals do |t|
      t.integer :type_id
      t.string :name

      t.timestamps
    end
    
    add_index :minerals, :type_id, :unique => true
  end
end
