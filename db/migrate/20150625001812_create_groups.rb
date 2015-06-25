class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :organization
      t.boolean :public, default: true
      t.integer :industry_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
