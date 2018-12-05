require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:rating) }
  end

  describe "statistics" do
    it 'should see average_review_score' do
      book_1 = Book.create(title: "Of Mice and Men",  pages: 170, published_year: 1932)
      user_1 = User.create(name: "jse")
      book_1.reviews.create(title: "Mumbo", description: "Jumbo", rating: 3, user: user_1)
      book_1.reviews.create(title: "Mumbo", description: "Jumbo", rating: 4, user: user_1)
      book_1.reviews.create(title: "Mumbo", description: "Jumbo", rating: 5, user: user_1)
      expect(book_1.average_review_score).to eq 4
    end
  end

  describe "relationships" do
    it { should belong_to :book}
    it { should belong_to :user}
  end
end
