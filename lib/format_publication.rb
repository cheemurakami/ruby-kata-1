class FormatPublication
  def self.run(publications)
    formatted_publications = []

    publications.each do |publication|
      title = "Title: #{publication.title}, "
      isbn = "ISBN: #{publication.isbn}, "
      authors = "Authors: #{publication.authors}, "
      description = publication.instance_of?(Book) ? "Description: #{publication.description}" : nil
      published_at = publication.instance_of?(Magazine) ? "Published at: #{publication.publishedAt}" : nil

      description_or_published_at = description || published_at
      
      formatted_publications << title + isbn + authors + description_or_published_at
    end

    formatted_publications
  end
end