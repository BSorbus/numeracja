class CreateNrnpTables < ActiveRecord::Migration[5.2]
  def change
    create_table :nrnp_tables do |t|
      t.string :routing_number,       index: true
      t.string :routing_number_type,  index: true
      t.string :zone,                 index: true
      t.string :zone_symbol,          index: true
      t.integer :operator,            index: true
      t.string :operator_name,        index: true
      t.datetime :modification,        index: true

      #t.timestamps
    end
  end
end
