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
    # @data = Club.all
    # respond_to do |format|
    #   format.csv { send_data @data.to_csv, filename: "clubs_#{Time.zone.today.strftime("%Y-%m-%d")}.csv" }
    # end
  end

end
