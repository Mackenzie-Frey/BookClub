require 'rails_helper'

describe 'a visitor to our web app' do
  before(:each) do
    @book_1 = Book.create(title: "War and Peace", pages: 293, published_year: 1983)
    @book_2 = Book.create(title: "A People's History of the Universe", pages: 999, published_year: 2024)
    @author_1 = @book_1.authors.create(name: "Thomas Christie")
    @author_2 = @book_1.authors.create(name: "Ferris Bueller")
    @author_2 = @book_2.authors.create(name: "Ferris Bueller")
  end
  it 'can delete a author' do
    visit author_path(@author_1)

    click_link "Delete Author"

    expect(current_path).to eq(books_path)
    expect(page).to have_no_content(@author_1.name)
    expect(page).to have_no_content(@book_1.title)
    expect(page).to have_content(@book_2.title)
  end
end
