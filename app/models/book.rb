class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :pages
  validates_presence_of :published_year
  has_many :reviews
  has_many :book_authors
  has_many :authors, through: :book_authors

  def average_review_score
    reviews.average(:rating).to_f
  end

  def self.books_by_reviews(limit = Book.count, order)
    Book.joins(:reviews)
      .select("books.*, avg(reviews.rating) as average_rating")
      .group(:id)
      .order("average_rating #{order}")
      .limit(limit)
  end

  def total_reviews
    reviews.count
  end

  def self.books_by_review_count(order)
    Book.joins(:reviews)
      .select("books.*, count(reviews) as total_reviews")
      .group(:id)
      .order("total_reviews #{order}")
  end

  def self.sort(sort_param, order)
    if sort_param == "pages"
      Book.order("#{sort_param} #{order}")

    elsif sort_param == "ratings"
      Book.books_by_reviews(order)

    elsif sort_param == "reviews"
      Book.books_by_review_count(order)
    end
  end
end
