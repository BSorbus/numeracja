class IspcTablesController < ApplicationController

  # GET /aus_tables
  # GET /aus_tables.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: IspcTableDatatable.new(params) }
    end
  end

  def export
    send_file "#{Rails.application.secrets.csv_files_path}/ISPC.csv", 
      type: 'text/csv; charset=utf-8; header=present', 
      disposition: "attachment; filename=ISPC.csv"
  end

  def export_xml
    send_file "#{Rails.application.secrets.csv_files_path}/ISPC.xml", 
      type: 'text/csv; charset=utf-8; header=present', 
      disposition: "attachment; filename=ISPC.xml"
  end

end
