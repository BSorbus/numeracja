class OrvcTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                 { source: "OrvcTable.id", searchable: false },
      phone_number:       { source: "OrvcTable.phone_number", cond: :eq },
      date_added:         { source: "OrvcTable.date_added" },
      date_deletion:      { source: "OrvcTable.date_added" },
      modification:       { source: "OrvcTable.modification" }
    }
  end

  def data
    records.map do |record|
      {
        id:                 record.id,
        phone_number:       record.phone_number,
        date_added:         record.date_added.present? ? record.date_added.strftime("%Y-%m-%d %H:%M") : "",
        date_deletion:      record.date_deletion.present? ? record.date_deletion.strftime("%Y-%m-%d %H:%M") : "",
        modification:       record.modification.present? ? record.modification.strftime("%Y-%m-%d %H:%M") : ""
      }
    end
  end

  def get_raw_records
    # insert query here
    OrvcTable.all
  end


end

