class NrnpTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                   { source: "NrnpTable.id" },
      routing_number:       { source: "NrnpTable.routing_number", cond: :like, searchable: true, orderable: true },
      routing_number_type:  { source: "NrnpTable.routing_number_type" },
      zone_ab:              { source: "NrnpTable.zone_ab", cond: :eq },
      zone_symbol:          { source: "NrnpTable.zone_symbol" },
      provider_id:          { source: "NrnpTable.provider_id", cond: :eq },
      provider_name:        { source: "NrnpTable.provider_name" },
      modification:         { source: "NrnpTable.modification" }
    }
  end

  def data
    records.map do |record|
      {
        id:                   record.id,
        routing_number:       record.routing_number,
        routing_number_type:  record.routing_number_type,
        zone_ab:              record.zone_ab,
        zone_symbol:          record.zone_symbol,
        provider_id:          record.provider_id,
        provider_name:        record.provider_name,
        modification:         record.modification.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    NrnpTable.all
  end

end
