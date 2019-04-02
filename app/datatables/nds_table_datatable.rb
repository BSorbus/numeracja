class NdsTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                 { source: "NdsTable.id", searchable: false },
      number:             { source: "NdsTable.number", cond: :like, searchable: true, orderable: true },
      provider_id:        { source: "NdsTable.provider_id", cond: :eq },
      provider_name:      { source: "NdsTable.provider_name" },
      modification:       { source: "NdsTable.modification" }
    }
  end

  def data
    records.map do |record|
      {
        id:                 record.id,
        number:             record.number,
        provider_id:        record.provider_id,
        provider_name:      record.provider_name,
        modification:       record.modification.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    NdsTable.all
  end

end

