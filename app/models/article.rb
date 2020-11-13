class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :grade
    belongs_to_active_hash :subject
    belongs_to_active_hash :genre

  belongs_to :user
  has_many :comments, dependent: :destroy
  

  with_options presence: true do
    validates :title
    validates :content
  end

  validates :grade_id, numericality: { other_than: 0, message: "を選択してください" }
  validates :subject_id, numericality: { other_than: 0, message: "を選択してください" }
  validates :genre_id, numericality: { other_than: 0, message: "を選択してください" }

end