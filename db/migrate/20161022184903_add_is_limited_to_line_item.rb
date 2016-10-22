class AddIsLimitedToLineItem < ActiveRecord::Migration
  def self.up
    add_column :line_items, :is_limited, :boolean
  end

  def self.down
    remove_column :line_items, :is_limited
  end
end
