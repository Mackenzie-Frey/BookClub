require 'rails_helper'

describe 'a user who visits our web app' do
  before(:each) do
    @user_1 = User.create(name: "rupert_merdoch08")
    @book_1 = Book.create(title: "War and Peace", pages: 293, published_year: 1983)
    @author_1 = @book_1.authors.create(name: "Thomas Christie")
    @review_1 = Review.create(title: "Amazing", description: "wonderful, would read again", rating: 2, user_id: @user_1.id, book_id: @book_1.id)
  end
  it 'creates a review' do
    visit book_path(@book_1)
    click_link 'Add Review'

    # save_and_open_page
    expect(current_path).to eq(new_book_review_path(@book_1))

    title = "Burgers and Milkshakes"
    description = "wonderful, would read again"
    rating = 4
    user = @user_1.name

    fill_in :review_title, with: title
    fill_in :review_description, with: description
    fill_in :review_rating, with: rating
    fill_in :review_user, with: user


    click_on "Create Review"

    expect(page).to have_content(title)
    expect(page).to have_content(description)
    expect(page).to have_content(rating)
    expect(current_path).to eq(book_path(@book_1))
  end
end
