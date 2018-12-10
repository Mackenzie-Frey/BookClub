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

  describe "it_sorts" do
    before(:each) do
      @user_1 = User.create(name: "NAMABYDE")
      @user_2 = User.create(name: "Timmy")

      @book_1 = Book.create(title: "Of Mice and Men",  pages: 170, published_year: 1932)

      @book_1.authors.create(name: "Jimmy Smit")

      @review_1 = @book_1.reviews.create(title: "KDFJLDSJF", description: "tjsk", rating: 1, user_id: @user_1.id)
      @review_2 = @book_1.reviews.create(title: "This thing", description: "yes", rating: 2, user_id: @user_1.id)
      @review_3 = @book_1.reviews.create(title: "JJJ", description: "--", rating: 3, user_id: @user_2.id)
    end

      it "by_newest_first" do
        expect(Review.sort("DESC")).to eq([@review_1, @review_2, @review_3])
      end

      # it "by_oldest_first" do
      #   expect(Review.sort("ASC")).to eq([@review_3, @review_2, @review_1])
      # end
  end
end
