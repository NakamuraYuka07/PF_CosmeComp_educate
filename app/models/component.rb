class Component < ApplicationRecord
  belongs_to :comp_categories, optional: true
end
