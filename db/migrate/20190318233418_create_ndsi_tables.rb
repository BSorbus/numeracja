class CreateNdsiTables < ActiveRecord::Migration[5.2]
  def change
    create_table :ndsi_tables do |t|
      t.integer :number,        index: true
      t.integer :provider_id,   index: true
      t.string :provider_name,  index: true, default: ""
      t.integer :number_type,   index: true
      t.datetime :modification, index: true

      #t.timestamps
    end
  end
end
