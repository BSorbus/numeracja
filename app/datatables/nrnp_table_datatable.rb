class NrnpTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                   { source: "NrnpTable.id" },
      routing_number:       { source: "NrnpTable.routing_number", cond: :like, searchable: true, orderable: true },
      routing_number_type:  { source: "NrnpTable.routing_number_type" },
      zone:                 { source: "NrnpTable.zone" },
      zone_symbol:          { source: "NrnpTable.zone_symbol" },
      operator:             { source: "NrnpTable.operator" },
      operator_name:        { source: "NrnpTable.operator_name" },
      change_date:          { source: "NrnpTable.change_date" }
    }
  end

  def data
    records.map do |record|
      {
        id:                   record.id,
        routing_number:       record.routing_number,
        routing_number_type:  record.routing_number_type,
        zone:                 record.zone,
        zone_symbol:          record.zone_symbol,
        operator:             record.operator,
        operator_name:        record.operator_name,
        change_date:          record.change_date
      }
    end
  end

  def get_raw_records
    # insert query here
    NrnpTable.all
  end

end
