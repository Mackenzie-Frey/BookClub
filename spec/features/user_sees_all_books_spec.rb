require 'rails_helper'

describe 'user_index' do
  it 'user_can_see_all_book_titles' do
    book_1 = Book.create(title: "Of Mice and Men", author: "John Steinbeck", pages: 170, published_year: 1932)
    book_2 = Book.create(title: "Great Gatsby", author: "F. Scott Fitzgerald", pages: 300, published_year: 1938)

    visit books_path

    expect(page).to  have_content(book_1.title)
    expect(page).to  have_content(book_1.author)
    expect(page).to  have_content(book_1.pages)
    expect(page).to  have_content(book_1.published_year)
    expect(page).to  have_content(book_2.title)
    expect(page).to  have_content(book_2.author)
    expect(page).to  have_content(book_2.pages)
    expect(page).to  have_content(book_2.published_year)
  end
end
