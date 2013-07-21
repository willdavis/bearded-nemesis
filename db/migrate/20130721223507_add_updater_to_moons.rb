class AddUpdaterToMoons < ActiveRecord::Migration
  def change
    add_column :moons, :updated_by_id, :integer
  end
end
