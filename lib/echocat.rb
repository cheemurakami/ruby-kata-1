# frozen_string_literal: true
# encoding: UTF-8

require 'csv'
require 'json'
require_relative './author.rb'
require_relative './publication.rb'

AUTHORS_CSV_PATH = '/workspaces/ruby-kata-1/data/authors.csv'
BOOKS_CSV_PATH = '/workspaces/ruby-kata-1/data/books.csv'
MAGAZINES_CSV_PATH = '/workspaces/ruby-kata-1/data/magazines.csv'

module Echocat
  def self.run
    # display authors
    puts Author.all.map(&:format)

    # display books and magazines
    puts Publication.all.map(&:format)

    # find a book or magazine by its isbn
    puts Publication.find_by_key('isbn', '5454-5587-3210').format

    # find a book or magazine by its author's email
    puts Publication.find_by_key('authors', 'null-walter@echocat.org').map(&:format)

    # sort by title
    puts Publication.sort_by_title.map(&:format)
  end
end
