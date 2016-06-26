class Pet < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	belongs_to :user
	self.inheritance_column = :_type_disabled # この行を追加


   
end
