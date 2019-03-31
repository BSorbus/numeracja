class PstnTablesController < ApplicationController

  # GET /aus_tables
  # GET /aus_tables.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: PstnTableDatatable.new(params) }
    end
  end

  def export
    respond_to do |format|
      format.csv {
        send_file "#{Rails.application.secrets.csv_files_path}/PSTN.csv", 
          type: 'text/csv; charset=utf-8; header=present', 
          disposition: "attachment; filename=PSTN.csv"
      }
      format.xml {
        send_file "#{Rails.application.secrets.csv_files_path}/PSTN.xml", 
          type: 'text/xml; charset=utf-8; header=present', 
          disposition: "attachment; filename=PSTN.xml"
      }
    end
  end

end
