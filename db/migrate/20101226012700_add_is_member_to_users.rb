class AddIsMemberToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :is_member, :boolean
  end

  def self.down
    remove_column :users, :is_member
  end
end
