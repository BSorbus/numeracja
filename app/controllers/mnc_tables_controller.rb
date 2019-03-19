class MncTablesController < ApplicationController


  # GET /mnc_tables
  # GET /mnc_tables.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: MncTableDatatable.new(params) }
    end
  end

end
