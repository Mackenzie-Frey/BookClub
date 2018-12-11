require 'rails_helper'

describe 'a visitor to our web app' do
  it 'can delete a review' do
    @book_1 = Book.create!(title: "War and Peace", pages: 293, published_year: 1983)
    @book_2 = Book.create(title: "A People's History of the Universe", pages: 999, published_year: 2024)
    @user_1 = User.create(name: "Luke Potter")
    @user_2 = User.create(name: "Hermione Skywalker")
    @review_1 = @user_1.reviews.create(title: "Changed my life", description: Faker::Hacker.say_something_smart, rating: 5, book: @book_1)
    @review_2 = @user_1.reviews.create(title: "Worst book ever", description: Faker::Hacker.say_something_smart, rating: 2, book: @book_2)

    visit user_path(@user_1)


    within("#review-#{@review_1.id}") do
      click_link "Delete Review"
    end

    expect(current_path).to eq(user_path(@user_1))
    expect(page).to have_no_content(@review_1.title)
  end
end
