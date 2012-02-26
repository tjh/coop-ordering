class AddBatchIdToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :batch_id, :integer
  end

  def self.down
    remove_column :orders, :batch_id
  end
end
