class CreateHescTables < ActiveRecord::Migration[5.2]
  def change
    create_table :hesc_tables do |t|
      t.integer :number,                    index: true
      t.integer :operator,                  index: true
      t.string :operator_name,              index: true, default: ""
      t.datetime :modification,             index: true
      t.string :service_description,        index: true, default: ""
      t.string :entity_providing_services,  index: true, default: ""

      #t.timestamps
    end
  end
end
