class IspcTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                 { source: "IspcTable.id" },
      number:             { source: "IspcTable.number", cond: :like, searchable: true, orderable: true },
      provider_id:        { source: "IspcTable.provider_id", cond: :eq },
      provider_name:      { source: "IspcTable.provider_name" },
      location:           { source: "IspcTable.location" },
      modification:       { source: "IspcTable.modification" }
    }
  end

  def data
    records.map do |record|
      {
        id:                 record.id,
        number:             record.number,
        provider_id:        record.provider_id,
        provider_name:      record.provider_name,
        location:           record.location,
        modification:       record.modification.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    IspcTable.all
  end

end

