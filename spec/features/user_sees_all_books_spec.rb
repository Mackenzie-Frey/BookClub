require 'rails_helper'

describe 'user_index' do
  before(:each) do
    book_1 = Book.create(title: "Of Mice and Men",  pages: 170, published_year: 1932)
    book_2 = Book.create(title: "Great Gatsby",  pages: 300, published_year: 1938)

    book_1.authors.create(name: "Jack")
    book_2.authors.create(name: "Jimmy")

    user_1 = User.create(name: "ian")
    user_2 = User.create(name: "John")

    book_1.reviews.create(title: "review_1", description: "heeee", rating: 1, user: user_1)
    book_1.reviews.create(title: "review_2", description: "heeee", rating: 2, user: user_1)
    book_2.reviews.create(title: "review_3", description: "changed my life", rating: 5, user: user_2)

    @books = [book_1, book_2]
  end

    it 'user_can_see_all_book_info' do
      visit books_path

      expect(page).to  have_content(@books[0].title)
      expect(page).to  have_content(@books[0].authors[0].name)
      expect(page).to  have_content(@books[0].pages)
      expect(page).to  have_content(@books[0].published_year)
      expect(page).to  have_content(@books[1].title)
      expect(page).to  have_content(@books[1].authors[0].name)
      expect(page).to  have_content(@books[1].pages)
      expect(page).to  have_content(@books[1].published_year)
      expect(page).to  have_css("img[src='#{@books[0].img}']")
  end


  describe 'user_can_see_average_book_rating' do
    it 'user_can_see_stats_for_individual_books' do
      visit books_path

      within"#indiv-book-stats" do
        expect(page).to have_content(@books[0].average_review_score.round)
        expect(page).to have_content(@books[0].total_reviews)
      end
    end
  end

  describe 'user_can_sort_books' do
    describe 'by_average_rating' do
      it 'displays_ascending' do
        visit books_path

        click_on "ratings-asc"

        expect(page).to have_current_path("/books?sort=ratings&order=asc")

        within(".books")do
          expect(all(".book-title")[0]).to have_content(@books[0].title)
          expect(all(".book-title")[1]).to have_content(@books[1].title)
        end
      end
      it 'displays_descending' do
        visit books_path

        click_on "ratings-desc"

        expect(page).to have_current_path("/books?sort=ratings&order=desc")

        within(".books") do
          expect(all(".book-title")[0]).to have_content(@books[1].title)
          expect(all(".book-title")[1]).to have_content(@books[0].title)
        end
      end
    end
    describe 'by_total_reviews' do
      it 'displays_ascending' do
        visit books_path

        click_on "reviews-asc"

        expect(page).to have_current_path("/books?sort=reviews&order=asc")

        within(".books")do
          expect(all(".book-title")[0]).to have_content(@books[1].title)
          expect(all(".book-title")[1]).to have_content(@books[0].title)
        end
      end
      it 'displays_descending' do
        visit books_path

        click_on "reviews-desc"

        expect(page).to have_current_path("/books?sort=reviews&order=desc")

        within(".books") do
          expect(all(".book-title")[0]).to have_content(@books[0].title)
          expect(all(".book-title")[1]).to have_content(@books[1].title)
        end
      end
    end
    describe 'by_page_counts' do
      it 'displays_ascending' do
        visit books_path

        click_on "pages-asc"

        expect(page).to have_current_path("/books?sort=pages&order=asc")

        within(".books")do
          expect(all(".book-title")[0]).to have_content(@books[0].title)
          expect(all(".book-title")[1]).to have_content(@books[1].title)
        end
      end
      it 'displays_descending' do
        visit books_path

        click_on "pages-desc"

        expect(page).to have_current_path("/books?sort=pages&order=desc")

        within(".books") do
          expect(all(".book-title")[0]).to have_content(@books[1].title)
          expect(all(".book-title")[1]).to have_content(@books[0].title)
        end
      end
    end

    describe 'books_index' do
      it 'user-can_select_book_title_links_to_navigate_to_book_show_page' do
        visit books_path

        within ".top-books" do
          click_on (@books[0].title)
          expect(page).to have_current_path(book_path(@books[0].id))
        end
      end
      it 'user_can_click_author_name_to_navigate_to_author_show_page' do
        visit books_path

        click_on (@books[0].authors[0].name)
        expect(page).to have_current_path(author_path(@books[0].authors[0].id))
      end
    end
  end
end
