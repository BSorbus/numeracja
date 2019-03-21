class NdinTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                 { source: "NdinTable.id" },
      scope:              { source: "NdinTable.scope", cond: :like, searchable: true, orderable: true },
      operator:           { source: "NdinTable.operator" },
      operator_name:      { source: "NdinTable.operator_name" },
      service_type_name:  { source: "NdinTable.service_type_name" },
      modification:       { source: "NdinTable.modification" }
    }
  end

  def data
    records.map do |record|
      {
        id:                 record.id,
        scope:              record.scope,
        operator:           record.operator,
        operator_name:      record.operator_name,
        service_type_name:  record.service_type_name,
        modification:       record.modification.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    NdinTable.all
  end

end
