class Author < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :book_authors
  has_many :books, through: :book_authors


  def self.clean_me_up(params)
    #params = "Hingle McKringleberry", "Donkey Teeth"
    author_names = params[:authors].split(', ')
    fixed_params = author_names.map do |author|
      cleaned_name = author.downcase.titlecase
      Author.find_or_create_by(name: cleaned_name)
    end
    params[:authors] = fixed_params
    params
  end
end
