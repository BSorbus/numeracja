class AusTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                   { source: "AusTable.id", searchable: false }, 
      number:               { source: "AusTable.number", cond: :like, searchable: true, orderable: true },
      provider_id:          { source: "AusTable.provider_id", cond: :eq },
      provider_name:        { source: "AusTable.provider_name" },
      service_description:  { source: "AusTable.service_description" },
      zone_ab:              { source: "AusTable.zone_ab", cond: :eq },
      zone_name:            { source: "AusTable.zone_name" },
      zone_symbol:          { source: "AusTable.zone_symbol" },
      modification:         { source: "AusTable.modification" }
    }
  end

  def data
    records.map do |record|
      {
        id:                   record.id,
        number:               record.number,
        provider_id:          record.provider_id,
        provider_name:        record.provider_name,
        service_description:  record.service_description,
        zone_ab:              record.zone_ab,
        zone_name:            record.zone_name,
        zone_symbol:          record.zone_symbol,
        modification:         record.modification.strftime("%Y-%m-%d")
        # modification:         record.modification.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    AusTable.all
  end

end

