class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.integer :order_id
      t.string :name
      t.integer :quantity
      t.decimal :price
      t.string :uom
      t.string :vendor_name
      t.integer :item_id
      t.integer :vendor_id

      t.timestamps
    end
  end

  def self.down
    drop_table :line_items
  end
end
