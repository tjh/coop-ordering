class AddIsStockedToLineItems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :is_stocked, :boolean
  end

  def self.down
    remove_column :line_items, :is_stocked
  end
end
