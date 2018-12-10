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
  end
end
