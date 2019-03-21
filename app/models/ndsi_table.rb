require 'csv'

class NdsiTable < ApplicationRecord

  def self.load_data_from_csv_file
    @buffer = []
    columns = [ :number, :operator, :operator_name, :number_type, :modification ]

    CSV.foreach("#{Rails.application.secrets.csv_files_path}/NDSI.csv", { 
                                                 encoding: "WINDOWS-1250:UTF-8", 
                                                 headers: true, 
                                                 converters: nil,
                                                 skip_blanks: false,
                                                 liberal_parsing: true,
                                                 col_sep: ';' }) do |row|

      insert_to_buffer(row)                        
    end 
    #AusTable.destroy_all
    ActiveRecord::Base.connection.execute("TRUNCATE ndsi_tables RESTART IDENTITY")
    NdsiTable.import columns, @buffer, validate: false    
  end

  private

    def self.insert_to_buffer(current_row)                        
      @buffer << [
        "#{current_row[0]}",
        "#{current_row[1]}", 
        "#{current_row[2]}",
        "#{current_row[3]}",
        "#{current_row[4]}"
      ]
    end

end
