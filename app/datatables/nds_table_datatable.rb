class NdsTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                 { source: "NdsTable.id" },
      number:             { source: "NdsTable.number", cond: :like, searchable: true, orderable: true },
      operator:           { source: "NdsTable.operator" },
      operator_name:      { source: "NdsTable.operator_name" },
      change_date:        { source: "NdsTable.change_date" }
    }
  end

  def data
    records.map do |record|
      {
        id:                 record.id,
        number:             record.number,
        operator:           record.operator,
        operator_name:      record.operator_name,
        change_date:        record.change_date.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    NdsTable.all
  end

end

