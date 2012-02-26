class CreateBatches < ActiveRecord::Migration
  def self.up
    create_table :batches do |t|
      t.datetime :deadline
      t.timestamps
    end
    begin
      Batch.create!(:deadline => 7.days.from_now)
    rescue => e
      puts "ERROR: Could not set the initial batch date...#{e.class.name}: #{e.message}"
    end
  end

  def self.down
    drop_table :batches
  end
end
