class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :author, :content, :dislikes, :likes
end
