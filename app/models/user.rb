class User < ApplicationRecord

  has_many :tweets, dependent: :destroy

  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記

  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet

  has_many :comments, dependent: :destroy

  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end

  mount_uploader :image, ImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
end
