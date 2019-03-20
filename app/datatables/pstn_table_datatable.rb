class PstnTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:             { source: "PstnTable.id" },
      scope:          { source: "PstnTable.scope", cond: :like, searchable: true, orderable: true },
      operator:       { source: "PstnTable.operator" },
      operator_name:  { source: "PstnTable.operator_name" },
      zone:           { source: "PstnTable.zone" },
      zone_name:      { source: "PstnTable.zone_name" },
      zone_symbol:    { source: "PstnTable.zone_symbol" },
      numbering_area: { source: "PstnTable.numbering_area" },
      change_date:    { source: "PstnTable.change_date" }
    }
  end

  def data
    records.map do |record|
      {
        id:             record.id,
        scope:          record.scope,
        operator:       record.operator,
        operator_name:  record.operator_name,
        zone:           record.zone,
        zone_name:      record.zone_name,
        zone_symbol:    record.zone_symbol,
        numbering_area: record.numbering_area,
        change_date:    record.change_date.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    PstnTable.all
  end

end

