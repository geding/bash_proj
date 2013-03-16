class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :like_value
      t.string :send_by_ip
      t.integer :post_id, :null => false
      t.timestamps
    end
  end
end
