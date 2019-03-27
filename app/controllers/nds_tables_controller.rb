class NdsTablesController < ApplicationController

  # GET /aus_tables
  # GET /aus_tables.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: NdsTableDatatable.new(params) }
    end
  end

  def export
    send_file "#{Rails.application.secrets.csv_files_path}/NDS.csv", 
      type: 'text/csv; charset=utf-8; header=present', 
      disposition: "attachment; filename=NDS.csv"
  end

  def export_xml
    send_file "#{Rails.application.secrets.csv_files_path}/NDS.xml", 
      type: 'text/csv; charset=utf-8; header=present', 
      disposition: "attachment; filename=NDS.xml"
  end

end
