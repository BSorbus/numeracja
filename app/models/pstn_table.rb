require 'csv'

class PstnTable < ApplicationRecord

  def self.load_data_from_csv_file
    @buffer = []
    columns = [ :zone_ab, :scope, :provider_name, :provider_id, :zone_name, :zone_symbol, :numbering_area, :modification ]

    CSV.foreach("#{Rails.application.secrets.csv_files_path}/PSTN.csv", { 
                                                 encoding: "WINDOWS-1250:UTF-8", 
                                                 headers: true, 
                                                 converters: nil,
                                                 skip_blanks: false,
                                                 liberal_parsing: true,
                                                 col_sep: ';' }) do |row|

      insert_to_buffer(row)                        
    end 
    ActiveRecord::Base.connection.execute("TRUNCATE pstn_tables RESTART IDENTITY")
    PstnTable.import columns, @buffer, validate: false    
    buffer_to_xml(@buffer)   
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
        "#{current_row[6]}",
        "#{current_row[7]}"
      ]
    end

    def self.buffer_to_xml(data)
      File.open("#{Rails.application.secrets.csv_files_path}/PSTN.xml", 'w+') do |f|
        f.puts '<?xml version="1.0" encoding="UTF-8"?>'
        f.puts '<table>'
        f.puts    "\t<header>"
        f.puts      "\t\t<title>T1</title>"
        f.puts      "\t\t<date>#{Time.zone.now.strftime('%Y-%m-%d %H:%M:%S')}</date>"
        f.puts    "\t</header>"
        f.puts    "\t<numbers>"

        data.each do |row|
          f.puts        "\t\t<pstn>"
          f.puts          "\t\t\t<range>#{row[1]}</range>"
          f.puts          "\t\t\t<zone>"
          f.puts            "\t\t\t\t<ab>#{row[0]}</ab>"
          f.puts            "\t\t\t\t<name>#{row[4]}</name>"
          f.puts            "\t\t\t\t<symbol>#{row[5]}</symbol>"
          f.puts          "\t\t\t</zone>"
          f.puts          "\t\t\t<provider>"
          f.puts            "\t\t\t\t<ID>#{row[3]}</ID>"
          f.puts            "\t\t\t\t<name><![CDATA[#{row[2]}]]></name>"
          f.puts          "\t\t\t</provider>"
          f.puts          "\t\t\t<numberArea>#{row[6]}</numberArea>"
          f.puts          "\t\t\t<modifyDate>#{row[7]}</modifyDate>"
          f.puts        "\t\t</pstn>"
        end

        f.puts    "\t</numbers>"
        f.puts "</table>"
      end 
    end

end
