require 'csv'

class OrvcTable < ApplicationRecord

  def self.load_data_from_csv_file
    @buffer = []
    columns = [ :phone_number, :date_added, :date_deletion ]

    CSV.foreach("#{Rails.application.secrets.csv_files_path}/ORVC.csv", { 
                                                 encoding: "WINDOWS-1250:UTF-8", 
                                                 headers: true, 
                                                 converters: nil,
                                                 skip_blanks: false,
                                                 liberal_parsing: true,
                                                 col_sep: ';' }) do |row|

      insert_to_buffer(row)                        
    end 
    ActiveRecord::Base.connection.execute("TRUNCATE orvc_tables RESTART IDENTITY")
    OrvcTable.import columns, @buffer, validate: false    
    buffer_to_xml(@buffer)
  end

  private

    def self.insert_to_buffer(current_row)                        
      @buffer << [
        "#{current_row[0]}",
        "#{current_row[1]}", 
        "#{current_row[2]}"
      ]
    end

    def self.buffer_to_xml(data)
      File.open("#{Rails.application.secrets.csv_files_path}/ORVC.xml", 'w+') do |f|
        f.puts '<?xml version="1.0" encoding="UTF-8"?>'
        f.puts '<table>'
        f.puts    "\t<header>"
        f.puts      "\t\t<title>ORVC</title>"
        f.puts      "\t\t<date>#{Time.zone.now.strftime('%Y-%m-%d %H:%M:%S')}</date>"
        f.puts    "\t</header>"
        f.puts    "\t<numbers>"

        data.each do |row|
          f.puts        "\t\t<orvc>"
          f.puts          "\t\t\t<phoneNumber>#{row[0]}</phoneNumber>"
          f.puts          "\t\t\t<dateAdded>#{row[1]}</dateAdded>"
          f.puts          "\t\t\t<dateDeletion>#{row[2]}</dateDeletion>"
          f.puts        "\t\t</orvc>"
        end

        f.puts    "\t</numbers>"
        f.puts "</table>"
      end 
    end

end
