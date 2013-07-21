class AddUsersToMoons < ActiveRecord::Migration
  def change
    add_column :moons, :user_id, :integer
  end
end
