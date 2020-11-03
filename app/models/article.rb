class Article < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :content
  end

  validates :grade_id, numericality: { other_than: 0, message: "を選択してください" }
  validates :subject_id, numericality: { other_than: 0, message: "を選択してください" }
  validates :genre_id, numericality: { other_than: 0, message: "を選択してください" }
end