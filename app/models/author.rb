class Author < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :book_authors, :dependent => :destroy
  has_many :books, through: :book_authors


  def self.clean_me_up(params)
    author_names = params[:authors].split(', ')
    fixed_params = author_names.map do |author|
      cleaned_name = author.downcase.titlecase
      Author.find_or_create_by(name: cleaned_name)
    end
    params[:title] = params[:title].downcase.titlecase
    params[:authors] = fixed_params
    params
  end
end
