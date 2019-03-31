class CreatePstnTables < ActiveRecord::Migration[5.2]
  def change
    create_table :pstn_tables do |t|
      t.integer :zone_ab,       index: true
      t.string :scope,          index: true, default: ""
      t.string :provider_name,  index: true, default: ""
      t.integer :provider_id,   index: true
      t.string :zone_name,      index: true, default: ""
      t.string :zone_symbol,    index: true, default: ""
      t.string :numbering_area, index: true, default: ""
      t.datetime :modification, index: true

      #t.timestamps
    end
  end
end
