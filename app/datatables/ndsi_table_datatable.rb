class NdsiTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                 { source: "NdsiTable.id" },
      number:             { source: "NdsiTable.number", cond: :like, searchable: true, orderable: true },
      provider_id:        { source: "NdsiTable.provider_id", cond: :eq },
      provider_name:      { source: "NdsiTable.provider_name" },
      number_type:        { source: "NdsiTable.number_type" },
      modification:       { source: "NdsiTable.modification" }
    }
  end

  def data
    records.map do |record|
      {
        id:                 record.id,
        number:             record.number,
        provider_id:        record.provider_id,
        provider_name:      record.provider_name,
        number_type:        record.number_type,
        modification:       record.modification.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    NdsiTable.all
  end

end

