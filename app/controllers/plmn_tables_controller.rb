class PlmnTablesController < ApplicationController

  # GET /plmn_tables
  # GET /plmn_tables.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: PlmnTableDatatable.new(params) }
    end
  end

end
