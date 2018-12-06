require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:pages) }
    it { should validate_presence_of(:published_year) }
  end

  describe "relationships" do
    it { should have_many :book_authors}
    it { should have_many(:authors).through(:book_authors)}
  end

  describe "class methods" do
    it "top books by reviews" do
      book_1 = Book.create(title: "Of Mice and Men",  pages: 170, published_year: 1932)
      book_2 = Book.create(title: "Of Mice and Men",  pages: 170, published_year: 1932)
      book_3 = Book.create(title: "Of Mice and Men",  pages: 170, published_year: 1932)
      user_1 = User.create(name: "jse")
      book_1.reviews.create(title: "Mumbo", description: "Jumbo", rating: 3, user: user_1)
      book_2.reviews.create(title: "Mumbo", description: "Jumbo", rating: 4, user: user_1)
      book_3.reviews.create(title: "Mumbo", description: "Jumbo", rating: 5, user: user_1)

      expect(Book.books_by_reviews(2, "DESC")).to eq([book_3, book_2])
    end
  end
end
