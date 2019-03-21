class CreateIspcTables < ActiveRecord::Migration[5.2]
  def change
    create_table :ispc_tables do |t|
      t.string :number,         index: true
      t.integer :operator,      index: true
      t.string :operator_name,  index: true
      t.string :location,       index: true
      t.datetime :modification,  index: true

      #t.timestamps
    end
  end
end
