class AddLastRenewedOnToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :last_renewed_on, :date
  end

  def self.down
    remove_column :users, :last_renewed_on
  end
end
