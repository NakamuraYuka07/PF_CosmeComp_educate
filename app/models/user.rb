class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  attachment :profile_image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_items, through: :favorites, source: :item
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum birth_month:
  { １月: 0, ２月: 1, ３月: 2, ４月: 3, ５月: 4, ６月: 5, ７月: 6, ８月: 7, ９月: 8, １０月: 9, １１月: 10, １２月: 11 }

  enum birth_day:
  { １日: 0,２日: 1,３日: 2,４日: 3,５日: 4,６日: 5,７日: 6,８日: 7,９日: 8,１０日: 9,１１日: 10,１２日: 11,１３日: 12,１４日: 13,１５日: 14,１６日: 15,１７日: 16,１８日: 17,１９日: 18,２０日: 19,２１日: 20,２２日: 21,２３日: 22,２４日: 23,２５日: 24,２６日: 25,２７日: 26,２８日: 27,２９日: 28,３０日: 29,３１日: 30 }

  enum age:
  { ２０代未満: 0, ２０代: 1, ３０代: 2, ４０代: 3, ５０代: 4, ６０代: 5 }

  enum skin_type:
  { 普通肌: 0, 乾燥肌: 1, 脂性肌: 2, 混合肌: 3 }
end
