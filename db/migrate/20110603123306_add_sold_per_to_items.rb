class AddSoldPerToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :sold_per, :string
  end

  def self.down
    remove_column :items, :sold_per
  end
end
