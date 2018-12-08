class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :art_id
      t.integer :bidder_id
      t.integer :winner_id
      t.string :text

      t.timestamps
    end
  end
end
