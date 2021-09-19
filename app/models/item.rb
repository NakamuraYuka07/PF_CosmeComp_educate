class Item < ApplicationRecord
  belongs_to :item_category
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  attachment :item_image
  validates :name, presence: true
  validates :explanation, presence: true
  validates :component, presence: true
  #validates :item_category_id, presence: true
  
  def self.search(search,word)
    if search == "forward_match"
      @item = Item.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
  　   @item = Item.where("name LIKE?","%#{word}")
　　elsif search == "perfect_match"
  　　@item = Item.where("#{word}")
　　elsif search == "partial_match"
　　　@item = Item.where("name LIKE?","%#{word}%")
　　else
  　　@item = Item.all
    end
  end


end
