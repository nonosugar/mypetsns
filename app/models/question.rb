class Question < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	has_many :answers
	belongs_to :user

	
	
end
