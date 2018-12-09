require 'rails_helper'

describe 'user_show_page' do
  it 'user_can_see_a_single_user' do
    user_1 = User.create(name: "NAMABYDE")
    user_2 = User.create(name: "Timmy")
    book_1 = Book.create(title: "Of Mice and Men",  pages: 170, published_year: 1932)
    book_1.authors.create(name: "Jimmy Smit")
    book_1.reviews.create(title: "KDFJLDSJF", description: "tjskljaejfkjdfl;ewioefdfdjs", rating: 1, user_id: user_1.id)
    book_1.reviews.create(title: "This thing", description: "yes", rating: 2, user_id: user_1.id)

    visit user_path(user_1)

    within"#user-summary"
      expect(page).to not_have_content(user_1.name)
      expect(page).to have_content(user_1.reviews[0].title)
      expect(page).to have_content(user_1.reviews[0].description)
      expect(page).to have_content(user_1.reviews[0].rating)
      expect(page).to have_content(user_2.reviews[1].title)
      expect(page).to have_content(user_2.reviews[1].description)
      expect(page).to have_content(user_2.reviews[1].rating)

      expect(page).to not_have_content(user_2.name)
  end
end
