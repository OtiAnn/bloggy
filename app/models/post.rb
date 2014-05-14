class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :comments
	mount_uploader :picture, PictureUploader
	default_scope { order("created_at DESC") } #按照創建時間排序


	def set_user!(user)
    	self.user_id = user.id
		self.save!
	end
end
