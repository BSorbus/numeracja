class VoipTableDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:             { source: "VoipTable.id", searchable: false },
      provider_id:    { source: "VoipTable.provider_id", cond: :eq },
      provider_name:  { source: "VoipTable.provider_name" },
      scope:          { source: "VoipTable.scope", cond: filter_custom_column_condition },
      modification:   { source: "VoipTable.modification" }
    }
  end

  def data
    records.map do |record|
      {
        id:             record.id,
        scope:          record.scope,
        provider_id:    record.provider_id,
        provider_name:  record.provider_name,
        modification:   record.modification.strftime("%Y-%m-%d")
        # modification:   record.modification.strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def get_raw_records
    # insert query here
    VoipTable.all
  end

  # def filter_custom_column_condition
  #   ->(column, value) { 
  #     # ::Arel::Nodes::SqlLiteral.new(" scope LIKE '#{ value }%' ")
  #     #car[:type].eq("electric").or(car[:description].matches("%hybrid%"))
  #     #::Arel::Nodes::SqlLiteral.new(column.field.to_s).matches("#{ value }%") 
  #     ::Arel.sql("'#{value}'").regexp_matches("'^' || replace(replace(replace(scope, '(', '['), ',', ''), ')', ']')  || '[0-9]*$'", right)
  #     .and( 
  #       Arel.sql("scope").matches("#{ value }%").and(
  #         Arel.sql("length('#{value}') <= 9")
  #         ) 
  #       )
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

