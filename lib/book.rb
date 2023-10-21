require_relative './convert_csv.rb'

class Book
  attr_reader :title, :isbn, :authors, :description

  def initialize(title:, isbn:, authors:, description:)
    @title = title
    @isbn = isbn
    @authors = authors
    @description = description
  end

  def self.all
    @books ||= initialize_books
  end

  def self.initialize_books
    books = []
    
    books_data = ConvertCSV.run(BOOKS_CSV_PATH)
    books_data.each do |book_hash|
      book = 
        Book.new(
          title: book_hash['title'],
          isbn: book_hash['isbn'], 
          authors: book_hash['authors'], 
          description: book_hash['description']
        )

      books << book
    end

    books
  end

  def format
    "Title: #{title}, isbn: #{isbn}, authors: #{authors}, description: #{description}"
  end
end