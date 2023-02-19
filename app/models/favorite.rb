class Favorite < ApplicationRecord
  belongs_to :memo
  belongs_to :user

  validates :memo_id, uniqueness: { scope: :user_id, message: "is already favorited by this user" }

end
