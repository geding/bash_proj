class AddLikesIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :likes_id, :integer
  end
end
