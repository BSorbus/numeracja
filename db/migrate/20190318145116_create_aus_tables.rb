class CreateAusTables < ActiveRecord::Migration[5.2]
  def change
    create_table :aus_tables do |t|
      t.integer :number,        index: true
      t.integer :provider_id,   index: true
      t.string  :provider_name, index: true, default: ""
      t.integer :zone_ab,       index: true
      t.string  :zone_name,     index: true, default: ""
      t.string  :zone_symbol,   index: true, default: ""
      t.datetime :modification, index: true

      #t.timestamps
    end
  end
end
