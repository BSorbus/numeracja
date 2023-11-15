class NdsTablesController < ApplicationController

  # GET /nds_tables
  # GET /nds_tables.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: NdsTableDatatable.new(params) }
    end
  end

  def export
    respond_to do |format|
      format.csv {
        send_file "#{Rails.application.secrets.csv_files_path}/NDS.csv", 
          type: 'text/csv; charset=utf-8; header=present', 
          disposition: "attachment; filename=NDS.csv"
      }
      format.xml {
        send_file "#{Rails.application.secrets.csv_files_path}/NDS.xml", 
          type: 'text/xml; charset=utf-8; header=present', 
          disposition: "attachment; filename=NDS.xml"
      }
    end
  end

end
