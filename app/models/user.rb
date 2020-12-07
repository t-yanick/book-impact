class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :username, presence: true, allow_blank: false,
                      uniqueness: { case_sensitive: false },
                      length: { in: 5..20 },
                      format: { without: /\s/, message: 'no spaces allowed' }      
  has_many :opinions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :followers, class_name: 'Following', foreign_key: 'follower_id', dependent: :destroy
  has_many :followeds, class_name: 'Following', foreign_key: 'follower_id', dependent: :destroy
  has_many :follows, through: :followers, source: :followed
  has_many :followds, through: :followeds, source: :follower

  def unfollow(user)
    follows.destroy(user)
  end

end
