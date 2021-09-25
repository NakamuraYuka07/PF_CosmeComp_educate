class Component < ApplicationRecord
  belongs_to :comp_category, optional: true
  
  validates :name, presence: true
  validates :explanation, presence: true
end
