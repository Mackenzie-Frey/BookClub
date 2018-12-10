require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do
    # it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:pages) }
    it { should validate_presence_of(:published_year) }
  end

  describe "relationships" do
    it { should have_many :book_authors}
    it { should have_many(:authors).through(:book_authors)}
  end

  describe 'instance methods' do
    it 'can retrieve top review for book' do
      user_1 = User.create(name: "jse")
      user_2 = User.create(name: "jse")
      user_3 = User.create(name: "jse")
      user_4 = User.create(name: "jse")
      book_1 = Book.create(title: "Of Mice and Men",  pages: 170, published_year: 1932)
      review_1 = book_1.reviews.create(title: "Mumbo", description: "Jumbo", rating: 5, user: user_1)
      book_1.reviews.create(title: "Mumbo", description: "Jumbo", rating: 4, user: user_2)
      book_1.reviews.create(title: "Mumbo", description: "Jumbo", rating: 3, user: user_3)
      book_1.reviews.create(title: "Mumbo", description: "Jumbo", rating: 2, user: user_4)

      expect(book_1.top_review).to eq(review_1)
    end
  end
  describe "class methods" do
    before(:each) do
      @book_1 = Book.create(title: "Of Mice and Men",  pages: 170, published_year: 1932)
      @book_2 = Book.create(title: "Pretty Woman",  pages: 200, published_year: 1932)
      @book_3 = Book.create(title: "Hedge Moon",  pages: 350, published_year: 1932)
      @user_1 = User.create(name: "jse")
      @book_1.reviews.create(title: "Mumbo", description: "Jumbo", rating: 3, user: @user_1)
      @book_2.reviews.create(title: "Mumbo", description: "Jumbo", rating: 4, user: @user_1)
      @book_2.reviews.create(title: "Mumbo", description: "Jumbo", rating: 5, user: @user_1)
      @book_3.reviews.create(title: "Mumbo", description: "Jumbo", rating: 5, user: @user_1)
      @book_3.reviews.create(title: "Mumbo", description: "Jumbo", rating: 5, user: @user_1)
      @book_3.reviews.create(title: "Mumbo", description: "Jumbo", rating: 5, user: @user_1)
      @book_3.reviews.create(title: "Mumbo", description: "Jumbo", rating: 5, user: @user_1)
    end

    it "top books by reviews" do
      expect(Book.books_by_reviews(2, "DESC")).to eq([@book_3, @book_2])
    end

    it "sorts_by_ascending_rating" do
      expect(Book.sort("ratings", "ASC")).to eq([@book_1, @book_2, @book_3])
    end

    it "sorts_by_descending_rating" do
      expect(Book.sort("ratings", "DESC")).to eq([@book_3, @book_2, @book_1])
    end

    it "sorts_by_ascending_pages_count" do
      expect(Book.sort("pages", "ASC")).to eq([@book_1, @book_2, @book_3])
    end

    it "sorts_by_descending_pages_count" do
      expect(Book.sort("pages", "DESC")).to eq([@book_3, @book_2, @book_1])
    end

    it "sorts_by_ascending_review_count" do
      expect(Book.sort("reviews", "ASC")).to eq([@book_1, @book_2, @book_3])
    end

    it "sorts_by_descending_review_count" do
      expect(Book.sort("reviews", "DESC")).to eq([@book_3, @book_2, @book_1])
    end
  end
end
