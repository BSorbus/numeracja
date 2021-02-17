class AddServiceDescriptionToAusTable < ActiveRecord::Migration[5.2]
  def change
    add_column :aus_tables, :service_description, :string, index: true, default: ""
  end
end
