class CreateVoipTables < ActiveRecord::Migration[5.2]
  def change
    create_table :voip_tables do |t|
      t.string :scope
      t.string :operator_name
      t.integer :operator
      t.datetime :modification

      #t.timestamps
    end
  end
end
