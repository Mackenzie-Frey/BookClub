require 'rails_helper'

describe 'user_index' do
  before(:each) do
    book_1 = Book.create(title: "Of Mice and Men",  pages: 170, published_year: 1932)
    book_2 = Book.create(title: "Great Gatsby",  pages: 300, published_year: 1938)

    book_1.authors.create(name: "Jack")
    book_2.authors.create(name: "Jimmy")

    user_1 = User.create(name: "ian")
    user_2 = User.create(name: "John")

    book_1.reviews.create(title: "review_1", description: "heeee", rating: 1, user: user_1)
    book_2.reviews.create(title: "review_2", description: "heeee", rating: 2, user: user_2)

    @books = [book_1, book_2]
  end

    it 'user_can_see_all_book_info' do
      visit books_path

      expect(page).to  have_content(@books[0].title)
      expect(page).to  have_content(@books[0].authors[0].name)
      expect(page).to  have_content(@books[0].pages)
      expect(page).to  have_content(@books[0].published_year)
      expect(page).to  have_content(@books[1].title)
      expect(page).to  have_content(@books[1].authors[0].name)
      expect(page).to  have_content(@books[1].pages)
      expect(page).to  have_content(@books[1].published_year)
  end

  describe 'user_can_see_average_book_rating' do
    it 'user_can_see_stats_for_individual_books' do
      visit books_path

      within"#indiv-book-stats" do
        expect(page).to have_content(@books[0].average_review_score)
        expect(page).to have_content(@books[0].total_reviews)
      end
    end
  end

  describe 'user_can_sort_books_by_average_rating' do
      it 'sorts_by_ascending' do
        visit books_path

        expect(page).to have_content(@books)
      end

      xit 'sorts_by_descending' do
        visit books_path

        expect(page).to have_content(@books.reverse)
      end
    end
  end
