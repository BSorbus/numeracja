class CreateVoipTables < ActiveRecord::Migration[5.2]
  def change
    create_table :voip_tables do |t|
      t.string :scope, 			index: true, default: ""
      t.string :provider_name,  index: true, default: ""
      t.integer :provider_id,   index: true
      t.datetime :modification, index: true

      #t.timestamps
    end
  end
end
