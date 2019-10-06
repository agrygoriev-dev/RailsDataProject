# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors

  validates :name, presence: true
  validates :name, uniqueness: true
end
