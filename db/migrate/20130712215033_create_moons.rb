class CreateMoons < ActiveRecord::Migration
  def change
    create_table :moons do |t|
      t.integer :celestial_id
      t.string :name
      t.integer :location_id

      t.timestamps
    end
    
    add_index :moons, :celestial_id, :unique => true
  end
end
