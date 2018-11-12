class AddStartTimeToArts < ActiveRecord::Migration[5.2]
  def change
    add_column :arts, :start_time, :string, default: ''
  end
end
