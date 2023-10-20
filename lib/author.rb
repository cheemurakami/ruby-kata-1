require_relative './convert_csv.rb'

class Author
  attr_reader :email, :first_name, :last_name
  
  def initialize(email:, first_name:, last_name:)
    @email = email
    @first_name = first_name
    @last_name = last_name
  end

  def self.all
    @authors ||= initialized_authors
    format_authors
  end

  def self.initialized_authors
    authors = []
    
    author_data ||= ConvertCSV.run(AUTHORS_CSV_PATH)
    author_data.each do |author_hash|
      author = 
        Author.new(
          email: author_hash['email'],
          first_name: author_hash['firstname'],
          last_name: author_hash['lastname'],
        )

      authors << author
    end

    authors
  end
  
  def self.format_authors
    formatted_authors = []

    @authors.each do |author|
      email = "Email: #{author.email}, "
      first_name = "First name: #{author.first_name}, "
      last_name = "Last name: #{author.last_name}"

      formatted_authors << email + first_name + last_name
    end

    formatted_authors
  end
end