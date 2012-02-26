class AddSequenceToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :sequence, :integer
  end

  def self.down
    remove_column :categories, :sequence
  end
end
