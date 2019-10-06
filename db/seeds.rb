# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
BookAuthor.destroy_all
BookGenre.destroy_all
Genre.destroy_all
Author.destroy_all
Book.destroy_all

csv_file = Rails.root + 'db/book_data.csv'
options = { file_encoding: 'iso-8859-1' }
books = SmarterCSV.process(csv_file)

books[0..200].each do |csv_book|
  csv_authors = csv_book[:book_authors].split('|').map(&:strip).compact if csv_book[:book_authors]
  csv_genres = csv_book[:genres].split('|').map(&:strip).compact if csv_book[:genres]

  book = Book.create(title: csv_book[:book_title],
                     description: csv_book[:book_desc],
                     image: csv_book[:image_url],
                     pages: csv_book[:book_pages])
  csv_authors.each do |a|
    author = Author.find_or_create_by(name: a)
    # puts author.inspect
    BookAuthor.create(book: book, author: author)
  end
  csv_genres.each do |g|
    genre = Genre.find_or_create_by(name: g)
    BookGenre.create(book: book, genre: genre)
  end
end

puts Book.count
