class AusTablesController < ApplicationController

  # GET /aus_tables
  # GET /aus_tables.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: AusTableDatatable.new(params) }
    end
  end

  def export
    respond_to do |format|
      format.csv {
        send_file "#{Rails.application.secrets.csv_files_path}/AUS.csv", 
          type: 'text/csv; charset=utf-8; header=present', 
          disposition: "attachment; filename=AUS.csv"
      }
      format.xml {
        send_file "#{Rails.application.secrets.csv_files_path}/AUS.xml", 
          type: 'text/xml; charset=utf-8; header=present', 
          disposition: "attachment; filename=AUS.xml"
      }
    end
  end

end
