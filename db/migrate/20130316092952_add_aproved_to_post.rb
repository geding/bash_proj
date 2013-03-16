class AddAprovedToPost < ActiveRecord::Migration
  def change
    add_column :posts, :aproved, :boolean
  end
end
