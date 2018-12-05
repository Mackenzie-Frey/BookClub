require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:rating) }
  end

  describe "statistics" do
    review_1 = Review.create(title: "Mumbo", description: "Jumbo", rating: 3)
    review_2 = Review.create(title: "Mumbo", description: "Jumbo", rating: 4)
    review_3 = Review.create(title: "Mumbo", description: "Jumbo", rating: 5)


    @reviews = [review_1, review_2, review_3]

    expect(@reviews.average_review_score).to eq 4
  end
end
