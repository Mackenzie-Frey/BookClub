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

  def self.books_by_reviews(limit, order)
    Book.joins(:reviews)
      .select("books.*, avg(reviews.rating) as average_rating")
      .group(:id)
      .order("average_rating #{order}")
      .limit(limit)
  end

  def total_reviews
    reviews.count
    # Book.joins(:reviews).select("books.*, count(reviews).id")
  end
end
