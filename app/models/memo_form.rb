class MemoForm
  include ActiveModel::Model

  attr_accessor(
    :title, :text, :user_id, :image,  :id, :created_at, :updated_at, :tag_name)

  with_options presence: true do
    validates :title
    validates :text
    validates :user_id
  end

  def save
    memo = Memo.create(title: title, text: text, image: image, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    MemoTag.create(memo_id: memo.id, tag_id: tag.id)
  end

  def update(params, memo)
    memo.update(params)
  end
end