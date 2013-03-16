class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  after_initialize :init

    def init
      self.likes  ||= 0           #will set the default value only if it's nil
      self.dislikes  ||= 0           #will set the default value only if it's nil
    end


  attr_accessible :author, :content, :dislikes, :likes
  
end
