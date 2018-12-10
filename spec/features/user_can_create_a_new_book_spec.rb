require 'rails_helper'

describe 'a user who visits our web app' do
  it 'creates a book' do
    visit books_path

    click_link 'Add Book'

    expect(current_path).to eq(new_book_path)

    title = "Burgers and Milkshakes"
    pages = 190
    published_year = 2015
    authors = "Hingle McKringleberry, Donkey Teeth"

    fill_in :book_title, with: title
    fill_in :book_pages, with: pages
    fill_in :book_published_year, with: published_year
    fill_in :book_authors, with: authors

    click_on "Create Book"

    expect(page).to have_content(title)
    expect(page).to have_content(pages)
    expect(page).to have_content(published_year)
    expect(current_path).to eq("/books/#{Book.last.id}")
  end
  it 'goes to new book page if title already exists in the library' do
    book_1 = Book.create!(title: "War and Peace", pages: 293, published_year: 1983)
    author_1 = book_1.authors.create(name: "Thomas Christie")

    visit new_book_path

    title = "War and Peace"
    pages = 190
    published_year = 2015
    authors = "Barney the Dinosaur"

    fill_in :book_title, with: title
    fill_in :book_pages, with: pages
    fill_in :book_published_year, with: published_year
    fill_in :book_authors, with: authors

    click_on "Create Book"

    expect(page).to have_content("Title has already been taken")
  end
end
