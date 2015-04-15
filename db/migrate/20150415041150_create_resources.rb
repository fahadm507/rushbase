class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :organization
      t.integer :user_id
    end
  end
end
