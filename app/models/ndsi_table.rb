require 'csv'

class NdsiTable < ApplicationRecord

  def self.load_data_from_csv_file
    @buffer = []
    columns = [ :number, :provider_id, :provider_name, :number_type, :modification ]

    CSV.foreach("#{Rails.application.secrets.csv_files_path}/NDSI.csv", { 
                                                 encoding: "WINDOWS-1250:UTF-8", 
                                                 headers: true, 
                                                 converters: nil,
                                                 skip_blanks: false,
                                                 liberal_parsing: true,
                                                 col_sep: ';' }) do |row|

      insert_to_buffer(row)                        
    end 
    ActiveRecord::Base.connection.execute("TRUNCATE ndsi_tables RESTART IDENTITY")
    NdsiTable.import columns, @buffer, validate: false    
    buffer_to_xml(@buffer)   
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

    def self.buffer_to_xml(data)
      File.open("#{Rails.application.secrets.csv_files_path}/NDSI.xml", 'w+') do |f|
        f.puts '<?xml version="1.0" encoding="UTF-8"?>'
        f.puts '<table>'
        f.puts    "\t<header>"
        f.puts      "\t\t<title>T3</title>"
        f.puts      "\t\t<date>#{Time.zone.now.strftime('%Y-%m-%d %H:%M:%S')}</date>"
        f.puts    "\t</header>"
        f.puts    "\t<numbers>"

        data.each do |row|
          f.puts        "\t\t<ndsi>"
          f.puts          "\t\t\t<number>#{row[0]}</number>"
          f.puts          "\t\t\t<provider>"
          f.puts            "\t\t\t\t<ID>#{row[1]}</ID>"
          f.puts            "\t\t\t\t<name>#{row[2]}</name>"
          f.puts          "\t\t\t</provider>"
          f.puts          "\t\t\t<numberKind>#{row[3]}</numberKind>"
          f.puts          "\t\t\t<modifyDate>#{row[4]}</modifyDate>"
          f.puts        "\t\t</ndsi>"
        end

        f.puts    "\t</numbers>"
        f.puts "</table>"
      end 
    end

end
