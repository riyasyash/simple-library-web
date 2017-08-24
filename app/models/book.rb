class Book < ApplicationRecord

  self.primary_key = "isbn"

  def self.add_to_library(isbn,count,book_hash)
    book = Book.find_by_isbn(isbn)
    if book
      book.total_count += count
      book.available += count
      book.save
      return book
    end
    book = Book.new
    book.title = book_hash["items"][0]["volumeInfo"]["title"]
    book.subtitle = book_hash["items"][0]["volumeInfo"]["subtitle"]
    authors = ""
    book.authors = book_hash["items"][0]["volumeInfo"]["authors"].join(',')
    book.publisher = book_hash["items"][0]["volumeInfo"]["publisher"]
    book.yop = book_hash["items"][0]["volumeInfo"]["publishedDate"]
    book.description = book_hash["items"][0]["volumeInfo"]["description"]
    book.page_count = book_hash["items"][0]["volumeInfo"]["pageCount"]
    book.thumbnail = book_hash["items"][0]["volumeInfo"]["imageLinks"]["thumbnail"]
    book.small_thumbnail = book_hash["items"][0]["volumeInfo"]["imageLinks"]["smallThumbnail"]
    book.total_count = count
    book.available = count
    book.isbn = isbn
    book.save

    return book
  end
end
