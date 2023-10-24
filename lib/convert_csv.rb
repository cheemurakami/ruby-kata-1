class ConvertCSV
  def self.run(csv_file_path)
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
end