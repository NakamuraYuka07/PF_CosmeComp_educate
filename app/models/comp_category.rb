class CompCategory < ApplicationRecord
  has_many :componente, dependent: :destroy
  validates :name, presence: true
end
