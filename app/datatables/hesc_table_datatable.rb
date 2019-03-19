class HescTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                         { source: "HescTable.id" },
      number:                     { source: "HescTable.number", cond: :like, searchable: true, orderable: true },
      operator:                   { source: "HescTable.operator" },
      change_date:                { source: "HescTable.change_date" },
      service_description:        { source: "HescTable.service_description" },
      entity_providing_services:  { source: "HescTable.entity_providing_services" }
    }
  end

  def data
    records.map do |record|
      {
        id:                         record.id,
        number:                     record.number,
        operator:                   record.operator,
        change_date:                record.change_date,
        service_description:        record.service_description,
        entity_providing_services:  record.entity_providing_services
      }
    end
  end

  def get_raw_records
    # insert query here
    HescTable.all
  end

end

