class AddActiveToPickups < ActiveRecord::Migration
  def self.up
    add_column :pickups, :active, :boolean
  end

  def self.down
    remove_column :pickups, :active
  end
end
