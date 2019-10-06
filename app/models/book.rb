# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :book_authors
  has_many :book_genres
end
