class CreateInTables < ActiveRecord::Migration[5.2]
  def change
    create_table :in_tables do |t|
      t.string :scope,              index: true
      t.string :operator_name,      index: true
      t.integer :operator,          index: true
      t.string :service_type_name,  index: true
      t.datetime :change_date,      index: true

      #t.timestamps
    end
  end
end
