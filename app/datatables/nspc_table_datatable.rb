class NspcTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                 { source: "NspcTable.id", searchable: false },
      zone_ab:            { source: "NspcTable.zone_ab", cond: :eq },
      number:             { source: "NspcTable.number", cond: :like, searchable: true, orderable: true },
      provider_id:        { source: "NspcTable.provider_id", cond: :eq },
      provider_name:      { source: "NspcTable.provider_name" },
      modification:       { source: "NspcTable.modification" }
    }
  end

  def data
    records.map do |record|
      {
        id:                 record.id,
        zone_ab:            record.zone_ab,
        number:             record.number,
        provider_id:        record.provider_id,
        provider_name:      record.provider_name,
        modification:       record.modification.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    NspcTable.all
  end

end

