require_relative './book.rb'
require_relative './magazine.rb'
require_relative './format_publication.rb'

class Publication
  def self.all
    @publications ||= Book.all + Magazine.all

    @formatted_publications ||= FormatPublication.run(@publications)
  end

  def self.find_by_key(key, search_word)
    if key == 'isbn' 
      results = @publications.select{|publication| publication.isbn == search_word}
    elsif key == 'authors'
      results =  @publications.select{|publication| publication.authors.include?(search_word)}
    end

    FormatPublication.run(results)
  end

  def self.sort_by_title
    results = @publications.sort_by{|publication| publication.title}

    FormatPublication.run(results)
  end
end