# frozen_string_literal: true
# encoding: UTF-8

require 'csv'
require 'json'

module Echocat
  def self.run
    # display authors
    authors

    # display books and magazines
    @books_and_magazines = self.books_and_magazines

    # find a book or magazine by its isbn
    find_by_key("5454-5587-3210")

    # find a book or magazine by its author's email
    find_by_key("null-walter@echocat.org")

    # sort by title
    sort_by_title
  end

  def self.convert_file(csv_file_path)
      csv_data = CSV.read(csv_file_path, headers: true, col_sep: ';', encoding: 'bom|utf-8')

      csv_data.map { |row| row.to_h }
  end

  def self.authors
    convert_file('/workspaces/ruby-kata-1/data/authors.csv')
  end

  def self.books_and_magazines
    books_json = convert_file('/workspaces/ruby-kata-1/data/books.csv' )
    magazines_json = convert_file('/workspaces/ruby-kata-1/data/magazines.csv')

    books_json + magazines_json
  end

  def self.find_by_key(search_word)
    key = isbn?(search_word) ? 'isbn' : 'authors'
    results =   @books_and_magazines.select{|data| data[key] == search_word}
    
    return results.first if key == 'isbn'

    results
  end

  def self.isbn?(search_word)
    search_word.split('-').join.length == 12 && !search_word.to_i.zero?
  end

  def self.sort_by_title
    @books_and_magazines.sort_by{|data| data['title']}
  end
end
