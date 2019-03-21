class CreateNspcTables < ActiveRecord::Migration[5.2]
  def change
    create_table :nspc_tables do |t|
      t.integer :zone,          index: true
      t.integer :number,        index: true
      t.integer :operator,      index: true
      t.string :operator_name,  index: true
      t.datetime :modification,  index: true

      #t.timestamps
    end
  end
end
