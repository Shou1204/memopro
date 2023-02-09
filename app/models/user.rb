class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :memos
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :avatar

  validates :name,      presence: true
  validates :avatar_id, presence: true
  validates :avatar_id, numericality: { other_than: 1, message: 'アバターを選択してください' } 
  
end
