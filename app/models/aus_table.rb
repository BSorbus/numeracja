require 'csv'

class AusTable < ApplicationRecord

  def self.load_data_from_csv_file
    @buffer = []
    columns = [ :number, :operator, :operator_name, :zone, :zone_name, :zone_symbol, :modification ]

    CSV.foreach("#{Rails.application.secrets.csv_files_path}/AUS.csv", { 
                                                 encoding: "WINDOWS-1250:UTF-8", 
                                                 headers: true, 
                                                 converters: nil,
                                                 skip_blanks: false,
                                                 liberal_parsing: true,
                                                 col_sep: ';' }) do |row|

      insert_to_buffer(row)                        
    end 
    #AusTable.destroy_all
    ActiveRecord::Base.connection.execute("TRUNCATE aus_tables RESTART IDENTITY")
    AusTable.import columns, @buffer, validate: false    
  end

  private

    def self.insert_to_buffer(current_row)                        
      @buffer << [
        "#{current_row[0]}",
        "#{current_row[1]}", 
        "#{current_row[2]}",
        "#{current_row[3]}",
        "#{current_row[4]}",
        "#{current_row[5]}",
        "#{current_row[6]}"
      ]
    end

end
