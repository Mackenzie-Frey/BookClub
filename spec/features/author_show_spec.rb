require 'rails_helper'

describe 'author_show' do
  it 'user_can_see_a_single_author' do
    author_1 = Author.create(name: "Jimmy Smit")
    book_1 = Book.create(title: "Of Mice and Men",  pages: 170, published_year: 1932)
    book_2 = Book.create(title: "Of Mice and Men 2: Electric Boogalo",  pages: 170, published_year: 1932)
    BookAuthor.create(author_id: author_1, book_id: book_1)
    BookAuthor.create(author_id: author_1, book_id: book_2)

    visit author_path(author_1)

    within "#author-information"
      expect(page).to have_content(author_1.name)
      expect(page).to have_content(book_1.title)
      expect(page).to have_content(book_1.pages)
      expect(page).to have_content(book_1.published_year)
      expect(page).to have_content(book_2.title)
      expect(page).to have_content(book_2.pages)
      expect(page).to have_content(book_2.published_year)
  end
  it 'user can see best review for this book' do
    user_1 = User.create(name: "NAMABYDE")
    user_2 = User.create(name: "Timmy")
    author_1 = Author.create(name: "Jimmy Smit")
    book_1 = Book.create(title: "Of Mice and Men",  pages: 170, published_year: 1932)
    book_2 = Book.create(title: "Of Mice and Men 2: Electric Boogalo",  pages: 170, published_year: 1932)
    book_1.reviews.create(title: "KDFJLDSJF", description: "tjskljaejfkjdfl;ewioefdfdjs", rating: 5, user_id: user_1.id)
    book_1.reviews.create(title: "rev_2", description: "hellol;ewioefdfdjs", rating: 1,  user_id: user_2.id)
    book_2.reviews.create(title: "another", description: "tjskljaejfkjdfl;ewioefdfdjs", rating: 1, user_id: user_1.id)
    book_2.reviews.create(title: "review", description: "hellol;ddfe", rating: 5,  user_id: user_2.id)
    BookAuthor.create(author_id: author_1, book_id: book_1)
    BookAuthor.create(author_id: author_1, book_id: book_2)

    visit author_path(author_1)

    within "#book-review"
      expect(page).to have_content(book_1.reviews[0].title)
      expect(page).to have_content(book_1.reviews[0].user_name(user_1.id))
      expect(page).to have_content(book_1.reviews[0].rating)
      expect(page).to have_content(book_1.reviews[0].description)
      expect(page).to have_content(book_2.reviews[1].title)
      expect(page).to have_content(book_2.reviews[1].user_name(user_2.id))
      expect(page).to have_content(book_2.reviews[1].rating)
      expect(page).to have_content(book_2.reviews[1].description)
  end
end
