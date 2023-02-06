class Tag < ApplicationRecord
  validates :tag,  uniqueness: true
  has_many :memo_tags
  has_many :memos, through: :memo_tags
end
