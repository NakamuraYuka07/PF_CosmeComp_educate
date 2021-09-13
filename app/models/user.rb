class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum skin_type: 
  { 普通肌: 0, 乾燥肌: 1, 脂性肌: 2, 混合肌: 3 }
end
