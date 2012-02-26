class AddNotesToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :notes, :text
  end

  def self.down
    remove_column :categories, :notes
  end
end
