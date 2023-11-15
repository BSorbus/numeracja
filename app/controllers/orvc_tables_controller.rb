class OrvcTablesController < ApplicationController

  # GET /orvc_tables
  # GET /orvc_tables.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: OrvcTableDatatable.new(params) }
    end
  end

  def export
    respond_to do |format|
      format.csv {
        send_file "#{Rails.application.secrets.csv_files_path}/ORVC.csv", 
          type: 'text/csv; charset=utf-8; header=present', 
          disposition: "attachment; filename=ORVC.csv"
      }
      format.xml {
        send_file "#{Rails.application.secrets.csv_files_path}/ORVC.xml", 
          type: 'text/xml; charset=utf-8; header=present', 
          disposition: "attachment; filename=ORVC.xml"
      }
    end
  end

end
