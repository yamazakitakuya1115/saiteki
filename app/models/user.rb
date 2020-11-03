class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :account, uniqueness: true, format: { with: /\A[a-zA-Z0-9]{3,20}/, message: 'は3〜20字の半角英数で入力してください' }
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }

  has_many :articles
end