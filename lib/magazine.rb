require_relative './convert_csv.rb'

class Magazine
  attr_reader :title, :isbn, :authors, :publishedAt
  
  def initialize(title:, isbn:, authors:, publishedAt:)
    @title = title
    @isbn = isbn
    @authors = authors
    @publishedAt = publishedAt
  end

  def self.all
    @magazines ||= initialized_magazines
  end

  def self.initialized_magazines
    magazines = []

    magazines_data = ConvertCSV.run(MAGAZINES_CSV_PATH)
    magazines_data.each do |magazine_hash|
      magazine = 
        Magazine.new(
          title: magazine_hash['title'],
          isbn: magazine_hash['isbn'],
          authors: magazine_hash['authors'], 
          publishedAt: magazine_hash['publishedAt']
        )

      magazines << magazine
    end

    magazines
  end

  def format
    "Title: #{title}, isbn: #{isbn}, Authors: #{authors}, Published at: #{publishedAt}"
  end
end