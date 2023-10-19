# frozen_string_literal: true
# encoding: UTF-8

require 'csv'
require 'json'

AUTHORS_CSV_PATH = '/workspaces/ruby-kata-1/data/authors.csv'
BOOKS_CSV_PATH = '/workspaces/ruby-kata-1/data/books.csv'
MAGAZINES_CSV_PATH = '/workspaces/ruby-kata-1/data/magazines.csv'

module Echocat
  def self.run
    # display authors
    authors

    # display books and magazines
    @books_and_magazines = self.books_and_magazines

    # find a book or magazine by its isbn
    find_by_key('isbn', '5454-5587-3210')

    # find a book or magazine by its author's email
    find_by_key('authors', 'null-walter@echocat.org')

    # sort by title
    sort_by_title
  end

  def self.convert_file(csv_file_path)
    csv_data = CSV.read(csv_file_path, headers: true, col_sep: ';', encoding: 'bom|utf-8')

    csv_data.map do |row|
      hash = row.to_h
      
      if hash['authors']      
        if hash['authors'].include?(',')
          hash['authors'] = hash['authors'].split(',')
        else
          hash['authors'] = [hash['authors']]
        end
      end

      hash
    end
  end

  def self.authors
    convert_file(AUTHORS_CSV_PATH)
  end

  def self.books_and_magazines
    books_json = convert_file(BOOKS_CSV_PATH)
    magazines_json = convert_file(MAGAZINES_CSV_PATH)

    books_json + magazines_json
  end

  def self.find_by_key(key, search_word)
    if key == 'isbn' 
      @books_and_magazines.select{|data| data[key] == search_word}.first
    elsif key == 'authors'
      @books_and_magazines.select{|data| data[key].include?(search_word)}
    end
  end

  def self.sort_by_title
    @books_and_magazines.sort_by{|data| data['title']}
  end
end
