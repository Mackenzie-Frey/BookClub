require 'rails_helper'

describe 'user_index' do
  it 'user_can_see_stats' do
    book_1 = Book.create(title: "Of Mice and Men", author: "John Steinbeck", pages: 170, published_year: 1932)
    book_2 = Book.create(title: "Great Gatsby", author: "F. Scott Fitzgerald", pages: 300, published_year: 1938)
    book_3 = Book.create(title: "Hello", author: "F. Scott Fitzgerald", pages: 22, published_year: 1955)
    book_4 = Book.create(title: "How are ya", author: "Dee Sill", pages: 306, published_year: 1877)
    book_5 = Book.create(title: "Tacos the wonder food", author: "W.E.B", pages: 475, published_year: 1477)
    book_6 = Book.create(title: "Hedgehogs: Nature's Happy Place", author: "Not a hog", pages: 44, published_year: 2018)

    visit books_path

    within "#statistics" do
      expect(page).to have_content("TOP RATED: #{book_6.title} #{book_6.rating}, #{book_5.title} #{book_5.rating}, #{book_4.title} #{book_4.rating}")
      expect(page).to have_content("LOWEST RATED: #{book_1.title} #{book_1.rating}, #{book_2.title} #{book_2.rating}, #{book_3.title} #{book_3.rating}")
      expect(page).to have_content("TOP POWER USERS: #{user_1.name} #{user_1.review_count}, #{user_2.name} #{user_2.review_count}, #{user_3.name} #{user_3.review_count}")
    end
  end
end
