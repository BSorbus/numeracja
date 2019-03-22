class CreatePlmnTables < ActiveRecord::Migration[5.2]
  def change
    create_table :plmn_tables do |t|
      t.string :scope,          index: true, default: ""
      t.integer :operator,      index: true
      t.string :operator_name,  index: true, default: ""
      t.datetime :modification, index: true
      t.string :scope_type,     index: true, default: ""

      #t.timestamps
    end
  end
end
