class NdsiTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                 { source: "NdsiTable.id" },
      number:             { source: "NdsiTable.number", cond: :like, searchable: true, orderable: true },
      operator:           { source: "NdsiTable.operator", cond: :eq },
      operator_name:      { source: "NdsiTable.operator_name" },
      number_type:        { source: "NdsiTable.number_type" },
      modification:       { source: "NdsiTable.modification" }
    }
  end

  def data
    records.map do |record|
      {
        id:                 record.id,
        number:             record.number,
        operator:           record.operator,
        operator_name:      record.operator_name,
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

