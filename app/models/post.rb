class Post < ActiveRecord::Base


  belongs_to :user
  has_many :likes
  # after_initialize :init

  #   def init

  #   end

def approve
 update_attributes(:approved =>true)
end
  attr_accessible :author, :content, :dislikes_n, :likes_n, :name, :approved
  
end
