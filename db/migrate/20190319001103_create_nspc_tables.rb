class CreateNspcTables < ActiveRecord::Migration[5.2]
  def change
    create_table :nspc_tables do |t|
      t.integer :zone_ab,       index: true
      t.string :number,         index: true
      t.integer :provider_id,   index: true
      t.string :provider_name,  index: true, default: ""
      t.datetime :modification, index: true

      #t.timestamps
    end
  end
end
