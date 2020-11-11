class Tweet < ApplicationRecord
  belongs_to :user

  validates :profile, length: {maximum: 1000}
  validates :hitokoto, length: {maximum: 30}
end