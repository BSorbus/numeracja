class PlmnTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:                 { source: "PlmnTable.id", searchable: false },
      provider_id:        { source: "PlmnTable.provider_id", cond: :eq },
      provider_name:      { source: "PlmnTable.provider_name" },
      scope_type:         { source: "PlmnTable.scope_type" },
      scope:              { source: "PlmnTable.scope", cond: filter_custom_column_condition },
      modification:       { source: "PlmnTable.modification" }
    }
  end

  def data
    records.map do |record|
      {
        id:                 record.id,
        scope:              record.scope,
        provider_id:        record.provider_id,
        provider_name:      record.provider_name,
        scope_type:         record.scope_type,
        modification:       record.modification.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    PlmnTable.all
  end

  # def filter_custom_column_condition
  #   ->(column, value) { 
  #     ::Arel::Nodes::SqlLiteral.new(" scope LIKE '#{ value }%' ") 
  #   }
  # end

  def filter_custom_column_condition
    ->(column, value) { 
      sanitize_search_text = Loofah.fragment(value).text;
      sql_str = "( " + 
        "'#{sanitize_search_text}' ~ ('^' || replace(replace(replace(#{column.field.to_s}, '(', '['), ',', ''), ')', ']')  || '[0-9]*$') " +
        " OR scope ILIKE '#{sanitize_search_text}%' ) " +
        " AND (length('#{sanitize_search_text}') <= 9 ) ";
      ::Arel::Nodes::SqlLiteral.new("#{sql_str}") 
      }
  end

end

