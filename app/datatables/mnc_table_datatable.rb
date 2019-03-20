class MncTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                 { source: "MncTable.id" },
      number:             { source: "MncTable.number", cond: :like, searchable: true, orderable: true },
      operator:           { source: "MncTable.operator" },
      operator_name:      { source: "MncTable.operator_name" },
      network:            { source: "MncTable.network" },
      change_date:        { source: "MncTable.change_date" }
    }
  end

  def data
    records.map do |record|
      {
        id:                 record.id,
        number:             record.number,
        operator:           record.operator,
        operator_name:      record.operator_name,
        network:            record.network,
        change_date:        record.change_date.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    MncTable.all
  end

end

