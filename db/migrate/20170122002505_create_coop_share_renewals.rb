class CreateCoopShareRenewals < ActiveRecord::Migration
  def self.up
    create_table :coop_share_renewals do |t|
      t.date :paid_on
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :coop_share_renewals
  end
end
