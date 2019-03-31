class CreateMncTables < ActiveRecord::Migration[5.2]
  def change
    create_table :mnc_tables do |t|
      t.string :number,         index: true, default: ""
      t.integer :provider_id,   index: true
      t.string :provider_name,  index: true, default: ""
      t.string :network,        index: true, default: ""
      t.datetime :modification, index: true

      #t.timestamps
    end
  end
end
