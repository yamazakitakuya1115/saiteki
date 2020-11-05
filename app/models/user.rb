class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name, length: {maximum: 30}
    validates :tweet, length: {maximum: 30}
    validates :account, uniqueness: {case_sensitive: false}, length: {in: 3..20}, format: { with: /\A[a-z0-9_]+\z/i, message: 'が登録できません' }
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }

  has_many :articles
  has_one_attached :image
end