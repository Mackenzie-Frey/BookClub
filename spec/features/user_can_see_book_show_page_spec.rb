require 'rails_helper'

describe 'book_show' do
  it 'user_can_see_a_single_book' do
    book_1 = Book.create(title: "Of Mice and Men",  pages: 170, published_year: 1932)
    book_1.authors.create(name: "Jimmy Smit")

    visit book_path(book_1)

    within "#book-information"
      expect(page).to have_content(book_1.title)
      expect(page).to have_content(book_1.pages)
      expect(page).to have_content(book_1.published_year)
      expect(page).to have_content(book_1.authors[0].name)
  end

  it 'user can see all reviews for this book' do
    user_1 = User.create(name: "NAMABYDE")
    user_2 = User.create(name: "Timmy")
    book_1 = Book.create(title: "Of Mice and Men",  pages: 170, published_year: 1932)
    book_1.authors.create(name: "Jimmy Smit")
    book_1.reviews.create(title: "KDFJLDSJF", description: "tjskljaejfkjdfl;ewioefdfdjs", rating: 1, user_id: user_1.id)
    book_1.reviews.create(title: "rev_2", description: "hellol;ewioefdfdjs", rating: 2,  user_id: user_2.id)

    visit book_path(book_1)

    within "#book-reviews"
      expect(page).to have_content(book_1.reviews[0].title)
      expect(page).to have_content(book_1.reviews[0].user_name(user_1.id))
      expect(page).to have_content(book_1.reviews[0].rating)
      expect(page).to have_content(book_1.reviews[0].description)
      expect(page).to have_content(book_1.reviews[1].title)
      expect(page).to have_content(book_1.reviews[1].user_name(user_2.id))
      expect(page).to have_content(book_1.reviews[1].rating)
      expect(page).to have_content(book_1.reviews[1].description)
  end
end
