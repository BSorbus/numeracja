class CreateOrvcTables < ActiveRecord::Migration[5.2]
  def change
    create_table :orvc_tables do |t|
      t.string :phone_number,		index: true, default: ""
      t.datetime :date_added, index: true
      t.datetime :date_deletion, index: true
      t.datetime :modification, index: true

      #t.timestamps
    end
  end
end
