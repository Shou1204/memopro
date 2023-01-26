class Memo < ApplicationRecord
  has_one_attached :image 
  belongs_to :user
  has_many :comments

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
