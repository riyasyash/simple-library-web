require "http"
require "json"

class BooksController < ApplicationController

  before_action :check_sign_in

  def create
    isbn = params["isbn"]
    count = params["count"].to_i
    body = HTTP.get('https://www.googleapis.com/books/v1/volumes?q=isbn:'+isbn).body
    book_hash = JSON.parse(body)
    book = Book.add_to_library(isbn,count,book_hash)
    respond_to do |format|
      format.json  { render :json => book.to_json }
    end
  end

  def list
  end
end
