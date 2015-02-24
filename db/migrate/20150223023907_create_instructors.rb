class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.integer :organization_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
