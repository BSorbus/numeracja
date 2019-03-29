class PstnTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:             { source: "PstnTable.id" },
      scope:          { source: "PstnTable.scope", cond: filter_custom_column_condition },
      operator:       { source: "PstnTable.operator", cond: :eq },
      operator_name:  { source: "PstnTable.operator_name" },
      zone:           { source: "PstnTable.zone", cond: :eq },
      zone_name:      { source: "PstnTable.zone_name" },
      zone_symbol:    { source: "PstnTable.zone_symbol" },
      numbering_area: { source: "PstnTable.numbering_area" },
      modification:   { source: "PstnTable.modification" }
    }
  end

  def data
    records.map do |record|
      {
        id:             record.id,
        scope:          record.scope,
        operator:       record.operator,
        operator_name:  record.operator_name,
        zone:           record.zone,
        zone_name:      record.zone_name,
        zone_symbol:    record.zone_symbol,
        numbering_area: record.numbering_area,
        modification:   record.modification.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    PstnTable.all
  end


  def filter_custom_column_condition
    #->(column) { ::Arel::Nodes::SqlLiteral.new(column.field.to_s).matches("#{ column.search.value }%") }
    ->(column, value) {
        sanitize_search_text = Loofah.fragment(value).text;
        sql_str = "( " + 
          "'#{sanitize_search_text}' ~ ('^' || replace(replace(replace(scope, '(', '['), ',', ''), ')', ']')  || '[0-9]{0,3}$') OR " +
          "scope ILIKE '#{sanitize_search_text}%' " +
          ") ";
        ::Arel::Nodes::SqlLiteral.new("#{sql_str}") 
        }
  end


  # def filter_custom_column_condition
  #   #->(column) { ::Arel::Nodes::SqlLiteral.new(column.field.to_s).matches("#{ column.search.value }%") }
  #   ->(column, value) {
  #       sanitize_search_text = Loofah.fragment(value).text;
  #       sql_str = " " + 
  #         "'#{sanitize_search_text}' ~ ('^' || zone || replace(replace(replace(scope, '(', '['), ',', ''), ')', ']')  || '[0-9]{0,3}$') OR " +
  #         "'#{sanitize_search_text}' ~ ('^' || replace(replace(replace(scope, '(', '['), ',', ''), ')', ']')  || '[0-9]{0,3}$') OR " +
  #         "pstn_tables.zone || pstn_tables.scope ILIKE '%#{sanitize_search_text}%' " +
  #         " ";
  #       ::Arel::Nodes::SqlLiteral.new("#{sql_str}") 
  #       }
  # end


end

