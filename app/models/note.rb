class Note < ActiveRecord::Base
	mount_uploader :image, ImageUploader
end
