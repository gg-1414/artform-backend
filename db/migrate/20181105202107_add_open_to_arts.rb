class AddOpenToArts < ActiveRecord::Migration[5.2]
  def change
    add_column :arts, :open, :boolean, default: true
  end
end
