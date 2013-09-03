class AddActivityIdToTimeblocks < ActiveRecord::Migration
  def change
    add_column :timeblocks, :activity_id, :integer
    add_index :timeblocks, :activity_id
  end
end
