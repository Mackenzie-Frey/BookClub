require 'rails_helper'

describe 'A visitor to our web app' do
  it 'sees a navigation bar' do
    visit books_path

    within("#nav-bar") do
      expect(page).to have_content("home")
      expect(page).to have_content("browse all books")
    end
  end
  it 'can click a nav link and go to the right page' do
    visit books_path

    click_on 'home-link'
    expect(current_path).to eq('/')
    click_on 'index-link'
    expect(current_path).to eq(books_path)
  end
end
