class DiaryComment < ApplicationRecord

  belongs_to :diary
  belongs_to :user

  validates :comment, presence: true
end
