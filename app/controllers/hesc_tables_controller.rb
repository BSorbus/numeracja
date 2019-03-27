class HescTablesController < ApplicationController

  # GET /aus_tables
  # GET /aus_tables.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: HescTableDatatable.new(params) }
    end
  end

  def export
    send_file "#{Rails.application.secrets.csv_files_path}/HESC.csv", 
      type: 'text/csv; charset=utf-8; header=present', 
      disposition: "attachment; filename=HESC.csv"
  end

  def export_xml
    send_file "#{Rails.application.secrets.csv_files_path}/HESC.xml", 
      type: 'text/csv; charset=utf-8; header=present', 
      disposition: "attachment; filename=HESC.xml"
  end

end


