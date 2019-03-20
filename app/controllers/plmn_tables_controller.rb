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
    send_file "#{Rails.application.secrets.csv_files_path}/PLMN.csv", 
      type: 'text/csv; charset=utf-8; header=present', 
      disposition: "attachment; filename=PLMN.csv"
  end

end
