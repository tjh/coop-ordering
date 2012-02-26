class AddPickupIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :pickup_id, :integer
  end

  def self.down
    remove_column :users, :pickup_id
  end
end
