class AusTablesController < ApplicationController

  # GET /aus_tables
  # GET /aus_tables.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: AusTableDatatable.new(params) }
    end
  end

end
