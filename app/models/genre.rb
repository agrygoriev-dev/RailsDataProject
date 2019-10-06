# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :book_genres
end
