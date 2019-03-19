class InTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                 { source: "InTable.id" },
      scope:              { source: "InTable.scope", cond: :like, searchable: true, orderable: true },
      operator:           { source: "InTable.operator" },
      operator_name:      { source: "InTable.operator_name" },
      service_type_name:  { source: "InTable.service_type_name" },
      change_date:        { source: "InTable.change_date" }
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
        change_date:        record.change_date
      }
    end
  end

  def get_raw_records
    # insert query here
    InTable.all
  end

end
