class Note < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	has_many :comments
	belongs_to :user

	belongs_to :user
	has_many :likes, dependent: :destroy

end
