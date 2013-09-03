class AddIndexesToTimeblocksAndActivities < ActiveRecord::Migration
  def change
    add_index :timeblocks, :user_id
    add_index :activities, :creator_id
    add_index :timeblocks, :created_at
    add_index :timeblocks, :updated_at
  end
end
