class RemoveScopeTypeFromPlmnTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :plmn_tables, :scope_type, :string
  end
end
