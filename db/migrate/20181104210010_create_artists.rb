class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :img_url

      t.timestamps
    end
  end
end
