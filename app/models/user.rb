class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :comments
  has_many :pets
  has_many :notes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :likes
  

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed_users
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationships", dependent: :destroy
  has_many :followers, through: :reverce_relationships, source: :follower
  

end
