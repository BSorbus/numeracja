class CreateM2mTables < ActiveRecord::Migration[5.2]
  def change
    create_table :m2m_tables do |t|
      t.string :scope,          index: true, default: ""
      t.integer :provider_id,   index: true
      t.string :provider_name,  index: true, default: ""
      t.datetime :modification, index: true
      t.string :scope_type,     index: true, default: ""

      #t.timestamps
    end
  end
end
