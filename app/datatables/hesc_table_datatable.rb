class HescTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                         { source: "HescTable.id" },
      number:                     { source: "HescTable.number", cond: :like, searchable: true, orderable: true },
      operator:                   { source: "HescTable.operator" },
      operator_name:              { source: "HescTable.operator_name" },
      service_description:        { source: "HescTable.service_description" },
      entity_providing_services:  { source: "HescTable.entity_providing_services" },
      modification:               { source: "HescTable.modification" }
    }
  end

  def data
    records.map do |record|
      {
        id:                         record.id,
        number:                     record.number,
        operator:                   record.operator,
        operator_name:              record.operator_name,
        service_description:        record.service_description,
        entity_providing_services:  record.entity_providing_services,
        modification:               record.modification.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    HescTable.all
  end

end

