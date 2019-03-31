class PlmnTablesController < ApplicationController

  # GET /plmn_tables
  # GET /plmn_tables.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: PlmnTableDatatable.new(params) }
    end
  end

  def export
    respond_to do |format|
      format.csv {
        send_file "#{Rails.application.secrets.csv_files_path}/PLMN.csv", 
          type: 'text/csv; charset=utf-8; header=present', 
          disposition: "attachment; filename=PLMN.csv"
      }
      format.xml {
        send_file "#{Rails.application.secrets.csv_files_path}/PLMN.xml", 
          type: 'text/xml; charset=utf-8; header=present', 
          disposition: "attachment; filename=PLMN.xml"
      }
    end
  end

end
