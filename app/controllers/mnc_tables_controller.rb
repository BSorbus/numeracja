class MncTablesController < ApplicationController

  # GET /aus_tables
  # GET /aus_tables.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: MncTableDatatable.new(params) }
    end
  end

  def export
    send_file "#{Rails.application.secrets.csv_files_path}/MNC.csv", 
      type: 'text/csv; charset=utf-8; header=present', 
      disposition: "attachment; filename=MNC.csv"
  end

end
