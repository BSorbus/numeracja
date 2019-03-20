class NrnpTablesController < ApplicationController

  # GET /aus_tables
  # GET /aus_tables.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: NrnpTableDatatable.new(params) }
    end
  end

  def export
    send_file "#{Rails.application.secrets.csv_files_path}/NRNP.csv", 
      type: 'text/csv; charset=utf-8; header=present', 
      disposition: "attachment; filename=NRNP.csv"
  end

end
