class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	belongs_to :post, :counter_cache => true
	has_many :comments, :dependent => :destroy
	mount_uploader :picture, PictureUploader
	# default_scope { order("created_at DESC") } #按照創建時間排序
	# validates :title, presence: true

	def set_user!(user)
    	self.user_id = user.id
		self.save!
	end
	#讓文章發佈時存取現在登入者的帳號！
end
