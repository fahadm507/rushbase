class CreatePrograms < ActiveRecord::Migration
  def up
    create_table :programs if !table_exists? :programs do |t|
      t.string :name, null: false
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
