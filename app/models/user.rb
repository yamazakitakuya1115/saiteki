class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  
  with_options presence: true do
    validates :name
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :who_id, numericality: {other_than: 0, message: "can't be blank" }

end