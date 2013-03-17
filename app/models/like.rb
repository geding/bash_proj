class Like < ActiveRecord::Base
  belongs_to :post
  attr_accessible :like_value, :send_by_ip, :post_id,
  :dislikes_n, :likes_n
  
  

  def addlike(post, ip)
    self.post_id = post.id
   if self.like_value == -1 #dislike
      post.update_attributes(:likes_n=> post.likes_n + 1, :dislikes_n => post.dislikes_n- 1)    
    elsif self.like_value == 0 #nothing
         post.update_attributes(:likes_n=> post.likes_n + 1)
    end
    self.like_value = 1

    
    self.send_by_ip = ip
    self.save

  end
  def adddislike(post_id,ip)
    self.post_id = post_id
   if self.like_value == 1 #like
      post.update_attributes(:likes_n=> post.likes_n - 1, :dislikes_n => post.dislikes_n+ 1)    
    elsif self.like_value == 0 #nothing
         post.update_attributes(:dislikes_n=> post.dislikes_n + 1)
    end
    self.like_value = -1
    

    self.send_by_ip = ip
    self.save
  end
end
