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
    where("name LIKE ?", "%#{search_word}%")
  end

  def self.get_by_sex(search_sex)
    where("sex = ?", "#{search_sex}")
  end

  def self.get_by_height(search_height)
    from = search_height.to_i - 2
    to = search_height.to_i + 2
    where(height: from..to)
  end

  def self.get_by_weight(search_weight)
    from = search_weight.to_i - 2
    to = search_weight.to_i + 2
    where(weight: from..to)
  end

  def self.get_by_target_weight(search_target_weight)
    from = search_target_weight.to_i - 2
    to = search_target_weight.to_i + 2
    where(target_weight: from..to)
  end

  def self.get_by_age(search_age)
    from_age = search_age.to_i - 2
    to_age = search_age.to_i + 2
    from_year = Date.today.strftime("%Y").to_i - to_age
    to_year = Date.today.strftime("%Y").to_i - from_age
    from = from_year.to_s
    to = to_year.to_s
    where(birthyear: from..to)
  end

  def self.get_by_style1(search_style)
    where("diet_style1 = ?", search_style)
  end

  def self.get_by_style2(search_style)
    where("diet_style2 = ?", search_style)
  end

  def self.get_by_style3(search_style)
    where("diet_style3 = ?", search_style)
  end

  def self.get_by_style4(search_style)
    where("diet_style4 = ?", search_style)
  end
  
  def limit_date(dates)
    if dates[0]  <　dates.last.prev_year
      @dates = dates.where(post_date)
    end
  end

  validates :name, length: { maximum: 10, minimum: 2 }
end
