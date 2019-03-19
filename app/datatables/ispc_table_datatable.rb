class IspcTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                 { source: "IspcTable.id" },
      number:             { source: "IspcTable.number", cond: :like, searchable: true, orderable: true },
      operator:           { source: "IspcTable.operator" },
      operator_name:      { source: "IspcTable.operator_name" },
      location:           { source: "IspcTable.location" },
      change_date:        { source: "IspcTable.change_date" }
    }
  end

  def data
    records.map do |record|
      {
        id:                 record.id,
        number:             record.number,
        operator:           record.operator,
        operator_name:      record.operator_name,
        location:           record.location,
        change_date:        record.change_date
      }
    end
  end

  def get_raw_records
    # insert query here
    IspcTable.all
  end

end

