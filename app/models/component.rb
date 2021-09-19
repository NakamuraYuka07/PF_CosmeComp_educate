class Component < ApplicationRecord
  belongs_to :comp_category, optional: true
  
  def self.search(search,word)
    if search == "forward_match"
      @component = Component.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
  　   @component = Component.where("name LIKE?","%#{word}")
　　elsif search == "perfect_match"
  　　@component = Component.where("#{word}")
　　elsif search == "partial_match"
　　　@component = Component.where("name LIKE?","%#{word}%")
　　else
  　　@component = Item.all
    end
  end
end
