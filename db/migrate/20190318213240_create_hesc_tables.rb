class CreateHescTables < ActiveRecord::Migration[5.2]
  def change
    create_table :hesc_tables do |t|
      t.integer :number
      t.integer :operator
      t.string :operator_name
      t.datetime :modification
      t.string :service_description
      t.string :entity_providing_services

      #t.timestamps
    end
  end
end
