class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  attachment :profile_image

  has_many :diaries, dependent: :destroy
  has_many :diary_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :user_rooms
  has_many :chats
  has_many :rooms, through: :user_rooms

  def following?(user)
    followings.include?(user)
  end

  def follow(user_id)
    active_relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    active_relationships.find_by(followed_id: user_id).destroy
  end

  def self.get_by_word(search_word)
    @users = User.where("name LIKE ?", "%#{search_word}%")
  end

  def self.get_by_sex(search_sex)
    @users = User.where("sex = ?", "#{search_sex}")
  end

  def self.get_by_height(search_height)
    from = search_height - 2
    to = search_height + 2
    @users = User.where(height: from..to)
  end

  def self.get_by_weight(search_weight)
    from = search_weight - 2
    to = search_weight + 2
    @users = User.where(weight: from..to)
  end

  def self.get_by_target_weight(search_target_weight)
    from = search_target_weight - 2
    to = search_target_weight + 2
    @users = User.where(target_weight: from..to)
  end
  
  def self.get_by_age(search_age)
    from_age = search_age - 2
    to_age = search_age + 2
    from_birthday_ymd = 
    @users = User.where(target_weight: from..to)
  end

  validates :name, length: { maximum: 10, minimum: 2 }
end
