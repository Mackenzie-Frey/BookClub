require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "class methods" do
    it "user with most reviews" do
      author_1 = Author.create(name: "John")
      book_1 = Book.create(title: "Of Mice and Men", authors: [author_1], pages: 170, published_year: 1932)
      book_3 = Book.create(title: "Hello", authors: [author_1], pages: 22, published_year: 1955)
      book_4 = Book.create(title: "How are ya", authors: [author_1], pages: 306, published_year: 1877)
      book_5 = Book.create(title: "Tacos the wonder food", authors: [author_1], pages: 475, published_year: 1477)
      book_6 = Book.create(title: "Hedgehogs: Nature's Happy Place", authors: [author_1], pages: 44, published_year: 2018)

      user_1 = User.create(name: "ian")
      user_2 = User.create(name: "John")
      user_3 = User.create(name: "Sally")
      user_4 = User.create(name: "Bill")

      book_1.reviews.create!(title: "review_1", description: "heeee", rating: 1, user: user_1)
      book_3.reviews.create(title: "review_2", description: "heeee", rating: 2, user: user_1)
      book_4.reviews.create(title: "review_3", description: "heeee", rating: 3, user: user_2)
      book_5.reviews.create(title: "review_4", description: "heeee", rating: 4, user: user_2)
      book_6.reviews.create(title: "review_5", description: "heeee", rating: 5, user: user_2)
      book_6.reviews.create(title: "review_5", description: "heeee", rating: 5, user: user_3)
      book_6.reviews.create(title: "review_5", description: "heeee", rating: 5, user: user_4)
      book_6.reviews.create(title: "review_5", description: "heeee", rating: 5, user: user_4)
      book_6.reviews.create(title: "review_5", description: "heeee", rating: 5, user: user_4)
      book_6.reviews.create(title: "review_5", description: "heeee", rating: 5, user: user_4)

      expect(User.users_by_review_count(2)).to eq([user_4, user_2])
    end
  end
end
