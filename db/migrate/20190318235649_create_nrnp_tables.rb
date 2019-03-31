class CreateNrnpTables < ActiveRecord::Migration[5.2]
  def change
    create_table :nrnp_tables do |t|
      t.string :routing_number,       index: true, default: ""
      t.string :routing_number_type,  index: true, default: ""
      t.string :zone_ab,              index: true, default: ""
      t.string :zone_symbol,          index: true, default: ""
      t.integer :provider_id,         index: true
      t.string :provider_name,        index: true, default: ""
      t.datetime :modification,       index: true

      #t.timestamps
    end
  end
end
