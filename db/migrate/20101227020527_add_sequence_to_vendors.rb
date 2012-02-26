class AddSequenceToVendors < ActiveRecord::Migration
  def self.up
    add_column :vendors, :sequence, :integer
  end

  def self.down
    remove_column :vendors, :sequence
  end
end
