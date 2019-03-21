class CreatePlmnTables < ActiveRecord::Migration[5.2]
  def change
    create_table :plmn_tables do |t|
      t.string :scope,          index: true
      t.integer :operator,      index: true
      t.string :operator_name,  index: true
      t.datetime :modification,  index: true
      t.string :scope_type,     index: true

      #t.timestamps
    end
  end
end
