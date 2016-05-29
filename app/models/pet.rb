class Pet < ActiveRecord::Base
	belongs_to :user
	self.inheritance_column = :_type_disabled # この行を追加
end
