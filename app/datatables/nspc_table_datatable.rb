class NspcTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                 { source: "NspcTable.id" },
      zone:               { source: "NspcTable.zone" },
      number:             { source: "NspcTable.number", cond: :like, searchable: true, orderable: true },
      operator:           { source: "NspcTable.operator" },
      operator_name:      { source: "NspcTable.operator_name" },
      change_date:        { source: "NspcTable.change_date" }
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
        change_date:        record.change_date
      }
    end
  end

  def get_raw_records
    # insert query here
    NspcTable.all
  end

end

