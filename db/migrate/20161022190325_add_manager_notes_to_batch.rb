class AddManagerNotesToBatch < ActiveRecord::Migration
  def self.up
    add_column :batches, :manager_notes, :text
  end

  def self.down
    remove_column :batches, :manager_notes
  end
end
