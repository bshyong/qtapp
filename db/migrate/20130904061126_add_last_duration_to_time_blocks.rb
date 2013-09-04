class AddLastDurationToTimeBlocks < ActiveRecord::Migration
  def change
    add_column :timeblocks, :last_duration, :integer, default: 0
  end
end
