class Component < ApplicationRecord
  belongs_to :comp_categories
  validates :name, presence: true
end
