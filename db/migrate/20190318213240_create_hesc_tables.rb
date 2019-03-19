class CreateHescTables < ActiveRecord::Migration[5.2]
  def change
    create_table :hesc_tables do |t|
      t.integer :number,                    index: true
      t.integer :operator,                  index: true
      t.datetime :change_date,              index: true
      t.string :service_description,        index: true
      t.string :entity_providing_services,  index: true

      #t.timestamps
    end
  end
end
