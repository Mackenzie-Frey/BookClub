class Review < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :rating
  belongs_to :user
  belongs_to :book

  def user_name(user_id)
    Review.distinct
    .joins(:user)
    .where(user_id: user_id)
    .pluck(:name)
    .first
  end

end
