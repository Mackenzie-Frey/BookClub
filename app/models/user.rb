class User < ApplicationRecord
  validates_presence_of :name
  has_many :reviews

  def self.users_by_review_count(limit)
    User.joins(:reviews)
      .select("users.*, count(reviews.id) as review_count")
      .group(:id)
      .order("review_count DESC")
      .limit(limit)
  end
end
