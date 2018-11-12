class AddWinnerIdToArts < ActiveRecord::Migration[5.2]
  def change
    add_column :arts, :winner_id, :integer, default: nil
  end
end
