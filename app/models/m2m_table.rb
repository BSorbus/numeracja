require 'csv'

class M2mTable < ApplicationRecord

  def self.load_data_from_csv_file
    @buffer = []
    columns = [ :scope, :provider_id, :provider_name, :modification ]

    CSV.foreach("#{Rails.application.secrets.csv_files_path}/M2M.csv", { 
                                                 encoding: "WINDOWS-1250:UTF-8", 
                                                 headers: true, 
                                                 converters: nil,
                                                 skip_blanks: false,
                                                 liberal_parsing: true,
                                                 col_sep: ';' }) do |row|

      insert_to_buffer(row)                        
    end 
    ActiveRecord::Base.connection.execute("TRUNCATE m2m_tables RESTART IDENTITY")
    M2mTable.import columns, @buffer, validate: false    
    buffer_to_xml(@buffer)   
  end

  private

    def self.insert_to_buffer(current_row)                        
      @buffer << [
        "#{current_row[0]}",
        "#{current_row[1]}", 
        "#{current_row[2]}",
        "#{current_row[3]}"
      ]
    end

    def self.buffer_to_xml(data)
      File.open("#{Rails.application.secrets.csv_files_path}/M2M.xml", 'w+') do |f|
        f.puts '<?xml version="1.0" encoding="UTF-8"?>'
        f.puts '<table>'
        f.puts    "\t<header>"
        f.puts      "\t\t<title>T2T9</title>"
        f.puts      "\t\t<date>#{Time.zone.now.strftime('%Y-%m-%d %H:%M:%S')}</date>"
        f.puts    "\t</header>"
        f.puts    "\t<numbers>"

        data.each do |row|
          f.puts        "\t\t<m2m>"
          f.puts          "\t\t\t<range>#{row[0]}</range>"
          f.puts          "\t\t\t<provider>"
          f.puts            "\t\t\t\t<ID>#{row[1]}</ID>"
          f.puts            "\t\t\t\t<name><![CDATA[#{row[2]}]]></name>"
          f.puts          "\t\t\t</provider>"
          f.puts          "\t\t\t<modifyDate>#{row[3]}</modifyDate>"
          f.puts        "\t\t</m2m>"
        end

        f.puts    "\t</numbers>"
        f.puts "</table>"
      end 
    end

end
