class NspcTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                 { source: "NspcTable.id" },
      zone:               { source: "NspcTable.zone", cond: :eq },
      number:             { source: "NspcTable.number", cond: :like, searchable: true, orderable: true },
      operator:           { source: "NspcTable.operator", cond: :eq },
      operator_name:      { source: "NspcTable.operator_name" },
      modification:       { source: "NspcTable.modification" }
    }
  end

  def data
    records.map do |record|
      {
        id:                 record.id,
        zone:               record.zone,
        number:             record.number,
        operator:           record.operator,
        operator_name:      record.operator_name,
        modification:       record.modification.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    NspcTable.all
  end

end

