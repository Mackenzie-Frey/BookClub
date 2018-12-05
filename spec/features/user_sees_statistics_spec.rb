require 'rails_helper'

describe 'user_index' do
  it 'user_can_see_stats' do
    author_1 = Author.create(name: "John")
    book_1 = Book.create(title: "Of Mice and Men", authors: [author_1], pages: 170, published_year: 1932)
    book_3 = Book.create(title: "Hello", authors: [author_1], pages: 22, published_year: 1955)
    book_4 = Book.create(title: "How are ya", authors: [author_1], pages: 306, published_year: 1877)
    book_5 = Book.create(title: "Tacos the wonder food", authors: [author_1], pages: 475, published_year: 1477)
    book_6 = Book.create(title: "Hedgehogs: Nature's Happy Place", authors: [author_1], pages: 44, published_year: 2018)
    user_1 = User.create(name: "ian")
    book_1.reviews.create(title: "review_1", description: "heeee", rating: 1, user: user_1)
    book_3.reviews.create(title: "review_2", description: "heeee", rating: 2, user: user_1)
    book_4.reviews.create(title: "review_3", description: "heeee", rating: 3, user: user_1)
    book_5.reviews.create(title: "review_4", description: "heeee", rating: 4, user: user_1)
    book_6.reviews.create(title: "review_5", description: "heeee", rating: 5, user: user_1)

    visit books_path

    within "#statistics" do
      expect(page).to have_content("TOP RATED: #{book_6.title} #{book_6.reviews[0].rating}, #{book_5.title} #{book_5.reviews[0].rating}, #{book_4.title} #{book_4.reviews[0].rating}")
      expect(page).to have_content("LOWEST RATED: #{book_1.title} #{book_1.reviews[0].rating}, #{book_3.title} #{book_3.reviews[0].rating}, #{book_4.title} #{book_4.reviews[0].rating}")
      expect(page).to have_content("TOP POWER USERS: #{user_1.name} #{user_1.review_count}, #{user_2.name} #{user_2.review_count}, #{user_3.name} #{user_3.review_count}")
    end
  end
end
