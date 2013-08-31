class CreateTimeblocks < ActiveRecord::Migration
  def change
    create_table :timeblocks do |t|
      t.datetime :starttime
      t.datetime :endtime
      t.integer :user_id
      t.integer :duration

      t.timestamps
    end
  end
end
