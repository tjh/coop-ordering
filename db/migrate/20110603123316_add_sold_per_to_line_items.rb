class AddSoldPerToLineItems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :sold_per, :string
  end

  def self.down
    remove_column :line_items, :sold_per
  end
end
