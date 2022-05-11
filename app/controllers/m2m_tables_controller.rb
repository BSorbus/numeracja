class M2mTablesController < ApplicationController

  # GET /m2m_tables
  # GET /m2m_tables.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: M2mTableDatatable.new(params) }
    end
  end

  def export
    respond_to do |format|
      format.csv {
        send_file "#{Rails.application.secrets.csv_files_path}/M2M.csv", 
          type: 'text/csv; charset=utf-8; header=present', 
          disposition: "attachment; filename=M2M.csv"
      }
      format.xml {
        send_file "#{Rails.application.secrets.csv_files_path}/M2M.xml", 
          type: 'text/xml; charset=utf-8; header=present', 
          disposition: "attachment; filename=M2M.xml"
      }
    end
  end

end
