class Post < ActiveRecord::Base
resourcify
rolify
  belongs_to :user
  has_many :likes
  after_initialize :init

    def init

    end


  attr_accessible :author, :content, :dislikes_n, :likes_n, :name
  
end
