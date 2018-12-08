class CreateArts < ActiveRecord::Migration[5.2]
  def change
    create_table :arts do |t|
      t.integer :artist_id
      t.string :title
      t.integer :starting_price
      t.string :img_url

      t.timestamps 
    end
  end
end
