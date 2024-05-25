class MncTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                 { source: "MncTable.id", searchable: false },
      number:             { source: "MncTable.number", cond: :like, searchable: true, orderable: true },
      provider_id:        { source: "MncTable.provider_id", cond: :eq },
      provider_name:      { source: "MncTable.provider_name" },
      network:            { source: "MncTable.network" },
      modification:       { source: "MncTable.modification" }
    }
  end

  def data
    records.map do |record|
      {
        id:                 record.id,
        number:             record.number,
        provider_id:        record.provider_id,
        provider_name:      record.provider_name,
        network:            record.network,
        modification:       record.modification.strftime("%Y-%m-%d")
        # modification:       record.modification.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    MncTable.all
  end

end

