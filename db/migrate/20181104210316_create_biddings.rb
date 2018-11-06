class CreateBiddings < ActiveRecord::Migration[5.2]
  def change
    create_table :biddings do |t|
      t.integer :art_id
      t.integer :bidder_id
      t.integer :bid_amount

      t.timestamps
    end
  end
end
