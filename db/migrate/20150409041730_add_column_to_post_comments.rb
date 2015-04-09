class AddColumnToPostComments < ActiveRecord::Migration
  def change
    add_column :post_comments, :user_id, :integer
  end
end
