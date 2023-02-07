class Memo < ApplicationRecord
  has_one_attached :image 
  belongs_to :user
  has_many :comments
  has_many :memo_tags, dependent: :destroy
  has_many :tags, through: :memo_tags
end
