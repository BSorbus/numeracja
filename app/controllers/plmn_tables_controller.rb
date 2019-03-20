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
    # @data = Club.all
    # respond_to do |format|
    #   format.csv { send_data @data.to_csv, filename: "clubs_#{Time.zone.today.strftime("%Y-%m-%d")}.csv" }
    # end
  end

end
