require 'rails_helper'

describe 'user_show_page' do
  before(:each) do
    @user_1 = User.create(name: "NAMABYDE")
    @user_2 = User.create(name: "Timmy")

    @book_1 = Book.create(title: "Of Mice and Men",  pages: 170, published_year: 1932)
    @book_2 = Book.create(title: "Understanding Chomsky",  pages: 999, published_year: 1901)

    @book_1.authors.create(name: "Jimmy Smit")

    @review_1 = @book_1.reviews.create(title: "KDFJLDSJF", description: "tjsk", rating: 1, user_id: @user_1.id, created_at: 5.days.ago)
    @review_2 = @book_2.reviews.create(title: "This thing", description: "yes", rating: 2, user_id: @user_1.id, created_at: 2.days.ago)
    @review_3 = @book_1.reviews.create(title: "JJJ", description: "--", rating: 3, user_id: @user_2.id, created_at: 1.days.ago)
  end

  it 'redirects if no user exists' do

    visit "users/burger"

    expect(page).to have_current_path(books_path)
  end

  it 'user_can_see_a_single_user' do
    visit user_path(@user_1)
    expect(page).to have_content(@user_1.name)
    expect(page).to have_content(@user_1.reviews[0].title)
    expect(page).to have_content(@user_1.reviews[0].description)
    expect(page).to have_content(@user_1.reviews[0].rating)

    expect(page).to have_content(@user_1.reviews[1].title)
    expect(page).to have_content(@user_1.reviews[1].description)
    expect(page).to have_content(@user_1.reviews[1].rating)

    expect(page).not_to have_content(@user_2.name)
    expect(page).not_to have_content(@user_2.reviews[0].title)
    expect(page).not_to have_content(@user_2.reviews[0].description)
    expect(page).not_to have_content(@user_2.reviews[0].rating)
  end

  describe 'sorts_reviews' do
    it 'displays_by_newest_first' do

      visit "users/#{@user_1.id}"

      click_on "review-date-desc"

      expect(page).to have_current_path("/users/#{@user_1.id}?sort=reviewsdate&order=desc")
      within"#review-#{@review_1.id}" do
        expect(page).to have_content(@user_1.reviews[0].title)
      end
    end

    it 'displays_by_oldest_first' do

      visit "users/#{@user_1.id}"

      click_on "review-date-asc"

      expect(page).to have_current_path("/users/#{@user_1.id}?sort=reviewsdate&order=asc")

      within"#review-#{@review_2.id}" do
        expect(page).to have_content(@user_1.reviews[1].title)
      end
    end
  end
end
