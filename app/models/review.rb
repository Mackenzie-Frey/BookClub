class Review < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :rating
  belongs_to :user
  belongs_to :book

  def average_review_score
    Review.average(:rating)
  end
end
