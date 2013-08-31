class CreateActivitesUsersTable < ActiveRecord::Migration
  def change
    create_table :activities_users, :id => false do |t|
      t.references :activity
      t.references :user
      t.timestamps
    end
    add_index :activities_users, [:activity_id, :user_id]
    add_index :activities_users, :user_id
  end
end
