# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :book_genres
  has_many :genres, through: :book_genres

  validates :title, presence: true
  validates :pages, numericality: { only_integer: true }
end
