class PstnTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:             { source: "PstnTable.id", searchable: false },
      provider_id:    { source: "PstnTable.provider_id", cond: :eq },
      provider_name:  { source: "PstnTable.provider_name" },
      zone_ab:        { source: "PstnTable.zone_ab", cond: :eq },
      zone_name:      { source: "PstnTable.zone_name" },
      zone_symbol:    { source: "PstnTable.zone_symbol" },
      numbering_area: { source: "PstnTable.numbering_area" },
      scope:          { source: "PstnTable.scope", cond: filter_custom_column_condition },
      modification:   { source: "PstnTable.modification" }
    }
  end

  def data
    records.map do |record|
      {
        id:             record.id,
        scope:          record.scope,
        provider_id:    record.provider_id,
        provider_name:  record.provider_name,
        zone_ab:        record.zone_ab,
        zone_name:      record.zone_name,
        zone_symbol:    record.zone_symbol,
        numbering_area: record.numbering_area,
        modification:   record.modification.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    PstnTable.references(:pstn_tables).all
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

  # def filter_custom_column_condition
  #   #->(column) { ::Arel::Nodes::SqlLiteral.new(column.field.to_s).matches("#{ column.search.value }%") }
  #   ->(column, value) {
  #       sanitize_search_text = Loofah.fragment(value).text;
  #       sql_str = "( (" + 
  #         "'#{sanitize_search_text}' ~ ('^' || replace(replace(replace(scope, '(', '['), ',', ''), ')', ']')  || '[0-9]*$') OR " +
  #         "scope ILIKE '#{sanitize_search_text}%' " +
  #         ") AND length('#{sanitize_search_text}') <= 9 ) ";
  #       ::Arel::Nodes::SqlLiteral.new("#{sql_str}") 
  #       }
  # end

end

