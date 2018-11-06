class CreateBidders < ActiveRecord::Migration[5.2]
  def change
    create_table :bidders do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :picture

      t.timestamps
    end
  end
end
