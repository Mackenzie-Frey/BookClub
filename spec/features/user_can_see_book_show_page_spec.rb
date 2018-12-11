require 'rails_helper'

describe 'book_show' do
  it 'user_can_see_a_single_book' do
    user_1 = User.create(name: "NAMABYDE")
    book_1 = Book.create(title: "Of Mice and Men",  pages: 170, published_year: 1932)
    book_1.authors.create(name: "Jimmy Smit")
    review_1 = book_1.reviews.create(title: "KDFJLDSJF", description: "tjskljaejfkjdfl;ewioefdfdjs", rating: 1, user_id: user_1.id)
    review_2 = book_1.reviews.create(title: "rev_2", description: "hellol;ewioefdfdjs", rating: 2,  user_id: user_1.id)
    review_3 = book_1.reviews.create(title: "rev_3", description: "hellol;ewioefdfdjs", rating: 3,  user_id: user_1.id)
    review_4 = book_1.reviews.create(title: "rev_4", description: "hellol;ewioefdfdjs", rating: 4,  user_id: user_1.id)
    review_5 = book_1.reviews.create(title: "rev_5", description: "hellol;ewioefdfdjs", rating: 5,  user_id: user_1.id)

    visit book_path(book_1)

    within "#book-information" do
      expect(page).to have_content(book_1.title)
      expect(page).to have_content(book_1.pages)
      expect(page).to have_content(book_1.published_year)
      expect(page).to have_content(book_1.authors[0].name)
    end
    within ".book-stats" do
      expect(page).to have_content(review_5.title)
    end
  end

  it 'user_can_see_all_reviews_for_this_book' do
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

  it 'user_can_click_a_user_link_to_user_show_page' do
    user_1 = User.create(name: "NAMABYDE")
    book_1 = Book.create(title: "Of Mice and Men",  pages: 170, published_year: 1932)
    book_1.authors.create(name: "Jimmy Smit")
    book_1.reviews.create(title: "KDFJLDSJF", description: "tjskljaejfkjdfl;ewioefdfdjs", rating: 1, user_id: user_1.id)

    visit book_path(book_1)

    within "#book-reviews" do
      click_on (user_1.name)
    end

    expect(page).to have_current_path(user_path(user_1))
  end
end
