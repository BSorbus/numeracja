class AusTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                 { source: "AusTable.id" },
      number:             { source: "AusTable.number", cond: :like, searchable: true, orderable: true },
      operator:           { source: "AusTable.operator" },
      operator_name:      { source: "AusTable.operator_name" },
      zone:               { source: "AusTable.zone" },
      zone_name:          { source: "AusTable.zone_name" },
      zone_symbol:        { source: "AusTable.zone_symbol" },
      change_date:        { source: "AusTable.change_date" }
    }
  end

  def data
    records.map do |record|
      {
        id:                 record.id,
        number:             record.number,
        operator:           record.operator,
        operator_name:      record.operator_name,
        zone:               record.zone,
        zone_name:          record.zone_name,
        zone_symbol:        record.zone_symbol,
        change_date:        record.change_date.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    AusTable.all
  end

end

