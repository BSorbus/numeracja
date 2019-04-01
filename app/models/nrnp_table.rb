require 'csv'

class NrnpTable < ApplicationRecord

  def self.load_data_from_csv_file
    @buffer = []
    columns = [ :routing_number, :routing_number_type, :zone_ab, :zone_symbol, :provider_id, :provider_name, :modification ]

    CSV.foreach("#{Rails.application.secrets.csv_files_path}/NRNP.csv", { 
                                                 encoding: "WINDOWS-1250:UTF-8", 
                                                 headers: true, 
                                                 converters: nil,
                                                 skip_blanks: false,
                                                 liberal_parsing: true,
                                                 col_sep: ';' }) do |row|

      insert_to_buffer(row)                        
    end 
    ActiveRecord::Base.connection.execute("TRUNCATE nrnp_tables RESTART IDENTITY")
    NrnpTable.import columns, @buffer, validate: false    
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
        "#{current_row[6]}"
      ]
    end

    def self.buffer_to_xml(data)
      File.open("#{Rails.application.secrets.csv_files_path}/NRNP.xml", 'w+') do |f|
        f.puts '<?xml version="1.0" encoding="UTF-8"?>'
        f.puts '<table>'
        f.puts    "\t<header>"
        f.puts      "\t\t<title>TZN NR</title>"
        f.puts      "\t\t<date>#{Time.zone.now.strftime('%Y-%m-%d %H:%M:%S')}</date>"
        f.puts    "\t</header>"
        f.puts    "\t<numbers>"

        data.each do |row|
          f.puts        "\t\t<nrnp>"
          f.puts          "\t\t\t<routingNumber>#{row[0]}</routingNumber>"
          f.puts          "\t\t\t<routingTypeName>#{row[1]}</routingTypeName>"
          f.puts          "\t\t\t<zone>"
          f.puts            "\t\t\t\t<name>#{row[2]}</name>"
          f.puts            "\t\t\t\t<symbol>#{row[3]}</symbol>"
          f.puts          "\t\t\t</zone>"
          f.puts          "\t\t\t<provider>"
          f.puts            "\t\t\t\t<ID>#{row[4]}</ID>"
          f.puts            "\t\t\t\t<name>#{row[5]}</name>"
          f.puts          "\t\t\t</provider>"
          f.puts          "\t\t\t<modifyDate>#{row[6]}</modifyDate>"
          f.puts        "\t\t</nrnp>"
        end

        f.puts    "\t</numbers>"
        f.puts "</table>"
      end 
    end

end
