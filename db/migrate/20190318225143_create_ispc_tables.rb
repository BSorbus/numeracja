class CreateIspcTables < ActiveRecord::Migration[5.2]
  def change
    create_table :ispc_tables do |t|
      t.string :number,         index: true, default: ""
      t.integer :operator,      index: true
      t.string :operator_name,  index: true, default: ""
      t.string :location,       index: true, default: ""
      t.datetime :modification, index: true

      #t.timestamps
    end
  end
end
