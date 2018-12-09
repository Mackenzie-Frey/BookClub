require 'rails_helper'

describe 'a user who visits our web app' do
  it 'creates a book' do
    author_1 = Author.create(name: "Madison Bradley")
    book_1 = Book.create(title: "Journey into the Unknown", pages: 453, published_year: 2018, authors: [author_1])

    visit new_book_path

    fill_in :title, with: title
    fill_in :pages, with: pages
    fill_in :published_year, with: published_year
    fill_in :authors, with: [author_1]

    click_on "Create Book"

    new_book = Book.last

    expect(current_path).to eq(book_path(new_book))
    expect(page).to have_content(title)
    expect(page).to have_content(pages)
    expect(page).to have_content(published_year)
    expect(page).to have_content(author.name)
  end
end
