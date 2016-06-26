class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :comments
  has_many :pets
  has_many :notes
  has_many :answers
  has_many :questions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, omniauth_providers: [:twitter,:facebook]


         validates :name, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader


    def self.from_omniauth(auth)
    # providerとuidでUserレコードを取得する
    # 存在しない場合は、ブロック内のコードを実行して作成する
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|

     # auth.provider には "twitter"、
      # auth.uidには twitterアカウントに基づいた個別のIDが入っている
      # first_or_createメソッドが自動でproviderとuidを設定してくれるので、
      # ここでは設定は必要ない
      user.name = auth.info.name # twitterで利用している名前が入る
      user.email = auth.info.email # twitterの場合入らない
    end
  end 
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
  def password_required?
    super && provider.blank?
  end
  def update_with_password(params, *options)
    # パスワードが空の場合
    if encrypted_password.blank?
      # パスワードがなくても更新できる
      update_attributes(params, *options)
    else
      super
    end
  end

  has_many :likes
  

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed_users
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationships", dependent: :destroy
  has_many :followers, through: :reverce_relationships, source: :follower
  

end
