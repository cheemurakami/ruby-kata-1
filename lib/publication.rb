require_relative './book.rb'
require_relative './magazine.rb'

class Publication
  def self.all
    @publications ||= Book.all + Magazine.all
  end

  def self.find_by_key(key, search_word)
    if key == 'isbn' 
      all.select{|publication| publication.isbn == search_word}.first
    elsif key == 'authors'
      all.select{|publication| publication.authors.include?(search_word)}
    end
  end

  def self.sort_by_title
    all.sort_by{|publication| publication.title}
  end
end