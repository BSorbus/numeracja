require 'csv'

class VoipTable < ApplicationRecord
  delegate :url_helpers, to: 'Rails.application.routes'

  def self.load_data_from_csv_file
    @buffer = []
    columns = [ :scope, :operator_name, :operator, :change_date ]

    CSV.foreach("#{Rails.application.secrets.csv_files_path}/VOIP.csv", { 
                                                 encoding: "WINDOWS-1250:UTF-8", 
                                                 headers: true, 
                                                 converters: nil,
                                                 skip_blanks: false,
                                                 liberal_parsing: true,
                                                 col_sep: ';' }) do |row|

      insert_to_buffer(row)                        
    end 
    #AusTable.destroy_all
    ActiveRecord::Base.connection.execute("TRUNCATE voip_tables RESTART IDENTITY")
    VoipTable.import columns, @buffer, validate: false    
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

end
