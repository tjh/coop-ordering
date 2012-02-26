class AddPickupIdToBatch < ActiveRecord::Migration
  def self.up
    add_column :batches, :pickup_id, :integer
  end

  def self.down
    remove_column :batches, :pickup_id
  end
end
