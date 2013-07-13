class MoonsAndMinerals < ActiveRecord::Migration
  def up
    create_table :minerals_moons, :id => false do |t|
      t.references :mineral, :moon
    end
  end

  def down
    drop_table :minerals_moons
  end
end
