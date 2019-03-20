class VoipTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:             { source: "VoipTable.id" },
      scope:          { source: "VoipTable.scope", cond: :like, searchable: true, orderable: true },
      operator:       { source: "VoipTable.operator" },
      operator_name:  { source: "VoipTable.operator_name" },
      change_date:    { source: "VoipTable.change_date" }
    }
  end

  def data
    records.map do |record|
      {
        id:             record.id,
        scope:          record.scope,
        operator:       record.operator,
        operator_name:  record.operator_name,
        change_date:    record.change_date.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    VoipTable.all
  end

end

