class VoipTablesController < ApplicationController

  # GET /aus_tables
  # GET /aus_tables.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: VoipTableDatatable.new(params) }
    end
  end

  def export
    respond_to do |format|
      format.csv {
        send_file "#{Rails.application.secrets.csv_files_path}/VOIP.csv", 
          type: 'text/csv; charset=utf-8; header=present', 
          disposition: "attachment; filename=VOIP.csv"
      }
      format.xml {
        send_file "#{Rails.application.secrets.csv_files_path}/VOIP.xml", 
          type: 'text/xml; charset=utf-8; header=present', 
          disposition: "attachment; filename=VOIP.xml"
      }
    end
  end

end
