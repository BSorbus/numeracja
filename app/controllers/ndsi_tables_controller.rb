class NdsiTablesController < ApplicationController

  # GET /ndsi_tables
  # GET /ndsi_tables.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: NdsiTableDatatable.new(params) }
    end
  end

  def export
    respond_to do |format|
      format.csv {
        send_file "#{Rails.application.secrets.csv_files_path}/NDSI.csv", 
          type: 'text/csv; charset=utf-8; header=present', 
          disposition: "attachment; filename=NDSI.csv"
      }
      format.xml {
        send_file "#{Rails.application.secrets.csv_files_path}/NDSI.xml", 
          type: 'text/xml; charset=utf-8; header=present', 
          disposition: "attachment; filename=NDSI.xml"
      }
    end
  end

end
