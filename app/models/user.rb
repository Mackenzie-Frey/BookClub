class User < ApplicationRecord
  validates_presence_of :name
  has_many :reviews

  def review_count
  end

  def power_users
    
  end
end
