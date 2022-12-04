class Movie < ApplicationRecord
  has_many :reviews

  validates :title, :director, presence: true
end
