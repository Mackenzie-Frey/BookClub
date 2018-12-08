require 'rails_helper'

describe 'user_index' do
  before(:each) do
    book_1 = Book.create(title: "Of Mice and Men",  pages: 170, published_year: 1932)
    book_2 = Book.create(title: "Great Gatsby",  pages: 300, published_year: 1938)
    book_1.authors.create(name: "Jack")
    book_2.authors.create(name: "Jimmy")

    @books = [book_1, book_2]
  end

    it 'user_can_see_all_book_titles' do
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
end
