class Book < ApplicationRecord
  has_and_belongs_to_many :users

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
    if book_hash["items"][0]["volumeInfo"]["authors"].present? 
      book.authors = book_hash["items"][0]["volumeInfo"]["authors"].join(',') 
    else
      book.authors = 'unknown'
    end
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

  def checkout(user)
    begin
      if self.available > 0
        self.available -= 1
        self.save
        user.books << self
        return 'successfuly checked out',200
      else
        return 'book not available',404
      end
    rescue
        return 'error occured during checkout',400
    end
  end

  def return_book(user)
    begin
      if user.books.include?(self)
        user.books.delete(self)
        self.available += 1
        self.save
        return 'successfuly returned',200
      else
        return "book not found in user's list",404
      end
    rescue
        return 'error occured during return',400
    end
  end

end
