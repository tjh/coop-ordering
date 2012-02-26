class AddFieldsToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :is_limited, :boolean
    add_column :items, :is_seasonal, :boolean
    add_column :items, :uom, :string
    add_column :items, :notes, :text
  end

  def self.down
    remove_column :items, :notes
    remove_column :items, :uom
    remove_column :items, :is_seasonal
    remove_column :items, :is_limited
  end
end
