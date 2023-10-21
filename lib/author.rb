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

  def format
    "Email: #{email}, First name: #{first_name}, Last name: #{last_name}"
  end
end