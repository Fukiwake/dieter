class Diary < ApplicationRecord
  
  belongs_to :user
  has_many :diary_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  attachment :image1
  attachment :image2
  attachment :image3
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.looks(word)
    @diaries = Diary.where("title LIKE ?", "%#{word}%")
  end
  
  validates :weight, presence: true
end
