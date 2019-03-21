class CreateMncTables < ActiveRecord::Migration[5.2]
  def change
    create_table :mnc_tables do |t|
      t.string :number,         index: true
      t.integer :operator,      index: true
      t.string :operator_name,  index: true
      t.string :network,        index: true
      t.datetime :modification,  index: true

      #t.timestamps
    end
  end
end
