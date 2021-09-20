class Item < ApplicationRecord
  belongs_to :item_category
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  attachment :item_image
  validates :name, presence: true
  validates :explanation, presence: true
  validates :component, presence: true
  #validates :item_category_id, presence: true
end
