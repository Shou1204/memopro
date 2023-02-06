class MemoForm
  include ActiveModel::Model

  attr_accessor(
    :title, :text, :user_id, :image, :id, :created_at, :updated_at,
    :tag
    )

  with_options presence: true do
    validates :title
    validates :text
    validates :user_id
  end

  def save
    Memo.create(title: title, text: text, image: image, user_id: user_id)
  end
end