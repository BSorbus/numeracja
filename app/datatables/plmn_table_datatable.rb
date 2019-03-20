class PlmnTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                 { source: "PlmnTable.id" },
      scope:              { source: "PlmnTable.scope", cond: :like, searchable: true, orderable: true },
      operator:           { source: "PlmnTable.operator" },
      operator_name:      { source: "PlmnTable.operator_name" },
      scope_type:         { source: "PlmnTable.scope_type" },
      change_date:        { source: "PlmnTable.change_date" }
    }
  end

  def data
    records.map do |record|
      {
        id:                 record.id,
        scope:              record.scope,
        operator:           record.operator,
        operator_name:      record.operator_name,
        scope_type:         record.scope_type,
        change_date:        record.change_date.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    PlmnTable.all
  end

end

