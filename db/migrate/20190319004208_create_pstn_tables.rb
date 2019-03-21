class CreatePstnTables < ActiveRecord::Migration[5.2]
  def change
    create_table :pstn_tables do |t|
      t.integer :zone,          index: true
      t.string :scope,          index: true
      t.string :operator_name,  index: true
      t.integer :operator,      index: true
      t.string :zone_name,      index: true
      t.string :zone_symbol,    index: true
      t.string :numbering_area, index: true
      t.datetime :modification,  index: true

      #t.timestamps
    end
  end
end
