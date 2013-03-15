class Post < ActiveRecord::Base
  attr_accessible :author, :content, :dislikes, :likes
end
