class VoipTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:             { source: "VoipTable.id" },
      operator:       { source: "VoipTable.operator", cond: :eq },
      operator_name:  { source: "VoipTable.operator_name" },
      scope:          { source: "VoipTable.scope", cond: filter_custom_column_condition },
      modification:   { source: "VoipTable.modification" }
    }
  end

  def data
    records.map do |record|
      {
        id:             record.id,
        scope:          record.scope,
        operator:       record.operator,
        operator_name:  record.operator_name,
        modification:   record.modification.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    VoipTable.all
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

