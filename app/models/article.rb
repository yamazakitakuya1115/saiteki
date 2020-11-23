class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :grade
    belongs_to_active_hash :subject
    belongs_to_active_hash :genre

  belongs_to :user
  with_options dependent: :destroy do
    has_many :comments
    has_many :favorites
  end
  

  with_options presence: true do
    validates :title
    validates :content
  end

  validates :grade_id, numericality: { other_than: 0, message: "を選択してください" }
  validates :subject_id, numericality: { other_than: 0, message: "を選択してください" }
  validates :genre_id, numericality: { other_than: 0, message: "を選択してください" }

  def self.title_search(search)
    if search != ""
      Article.where('title LIKE(?)', "%#{search}%")
    end
  end

  def self.content_search(search)
    if search != ""
      Article.where('content LIKE(?)', "%#{search}%")
    end
  end

end