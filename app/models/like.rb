class Like < ActiveRecord::Base
  belongs_to :post
  attr_accessible :like_value, :send_by_ip, :post_id
  

  def addlike(post_id, ip)
    self.post_id = post_id
    self.like_value = 1
    self.send_by_ip = ip
    self.save
  end
end
