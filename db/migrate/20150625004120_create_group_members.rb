class CreateGroupMembers < ActiveRecord::Migration
  def change
    create_table :group_members do |t|
      t.integer :user_id, null: false
      t.integer :group_id, null: false
      t.boolean :group_admin, default: false
    end
    add_index :group_members, :group_id
    add_index :group_members, :user_id
    add_index :group_members, [:group_id, :user_id], unique: true
  end
end
