class HescTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                         { source: "HescTable.id", searchable: false },
      number:                     { source: "HescTable.number", cond: :like, searchable: true, orderable: true },
      provider_id:                { source: "HescTable.provider_id", cond: :eq },
      provider_name:              { source: "HescTable.provider_name" },
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
        provider_id:                record.provider_id,
        provider_name:              record.provider_name,
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

