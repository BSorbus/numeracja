# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_19_005214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aus_tables", force: :cascade do |t|
    t.integer "number"
    t.integer "provider_id"
    t.string "provider_name", default: ""
    t.integer "zone_ab"
    t.string "zone_name", default: ""
    t.string "zone_symbol", default: ""
    t.datetime "modification"
    t.index ["modification"], name: "index_aus_tables_on_modification"
    t.index ["number"], name: "index_aus_tables_on_number"
    t.index ["provider_id"], name: "index_aus_tables_on_provider_id"
    t.index ["provider_name"], name: "index_aus_tables_on_provider_name"
    t.index ["zone_ab"], name: "index_aus_tables_on_zone_ab"
    t.index ["zone_name"], name: "index_aus_tables_on_zone_name"
    t.index ["zone_symbol"], name: "index_aus_tables_on_zone_symbol"
  end

  create_table "hesc_tables", force: :cascade do |t|
    t.integer "number"
    t.integer "provider_id"
    t.string "provider_name", default: ""
    t.datetime "modification"
    t.string "service_description", default: ""
    t.string "entity_providing_services", default: ""
    t.index ["entity_providing_services"], name: "index_hesc_tables_on_entity_providing_services"
    t.index ["modification"], name: "index_hesc_tables_on_modification"
    t.index ["number"], name: "index_hesc_tables_on_number"
    t.index ["provider_id"], name: "index_hesc_tables_on_provider_id"
    t.index ["provider_name"], name: "index_hesc_tables_on_provider_name"
    t.index ["service_description"], name: "index_hesc_tables_on_service_description"
  end

  create_table "ispc_tables", force: :cascade do |t|
    t.string "number", default: ""
    t.integer "provider_id"
    t.string "provider_name", default: ""
    t.string "location", default: ""
    t.datetime "modification"
    t.index ["location"], name: "index_ispc_tables_on_location"
    t.index ["modification"], name: "index_ispc_tables_on_modification"
    t.index ["number"], name: "index_ispc_tables_on_number"
    t.index ["provider_id"], name: "index_ispc_tables_on_provider_id"
    t.index ["provider_name"], name: "index_ispc_tables_on_provider_name"
  end

  create_table "mnc_tables", force: :cascade do |t|
    t.string "number", default: ""
    t.integer "provider_id"
    t.string "provider_name", default: ""
    t.string "network", default: ""
    t.datetime "modification"
    t.index ["modification"], name: "index_mnc_tables_on_modification"
    t.index ["network"], name: "index_mnc_tables_on_network"
    t.index ["number"], name: "index_mnc_tables_on_number"
    t.index ["provider_id"], name: "index_mnc_tables_on_provider_id"
    t.index ["provider_name"], name: "index_mnc_tables_on_provider_name"
  end

  create_table "ndin_tables", force: :cascade do |t|
    t.string "scope", default: ""
    t.string "provider_name", default: ""
    t.integer "provider_id"
    t.string "service_type_name", default: ""
    t.datetime "modification"
    t.index ["modification"], name: "index_ndin_tables_on_modification"
    t.index ["provider_id"], name: "index_ndin_tables_on_provider_id"
    t.index ["provider_name"], name: "index_ndin_tables_on_provider_name"
    t.index ["scope"], name: "index_ndin_tables_on_scope"
    t.index ["service_type_name"], name: "index_ndin_tables_on_service_type_name"
  end

  create_table "nds_tables", force: :cascade do |t|
    t.integer "number"
    t.integer "provider_id"
    t.string "provider_name", default: ""
    t.datetime "modification"
    t.index ["modification"], name: "index_nds_tables_on_modification"
    t.index ["number"], name: "index_nds_tables_on_number"
    t.index ["provider_id"], name: "index_nds_tables_on_provider_id"
    t.index ["provider_name"], name: "index_nds_tables_on_provider_name"
  end

  create_table "ndsi_tables", force: :cascade do |t|
    t.integer "number"
    t.integer "provider_id"
    t.string "provider_name", default: ""
    t.integer "number_type"
    t.datetime "modification"
    t.index ["modification"], name: "index_ndsi_tables_on_modification"
    t.index ["number"], name: "index_ndsi_tables_on_number"
    t.index ["number_type"], name: "index_ndsi_tables_on_number_type"
    t.index ["provider_id"], name: "index_ndsi_tables_on_provider_id"
    t.index ["provider_name"], name: "index_ndsi_tables_on_provider_name"
  end

  create_table "nrnp_tables", force: :cascade do |t|
    t.string "routing_number", default: ""
    t.string "routing_number_type", default: ""
    t.string "zone_ab", default: ""
    t.string "zone_symbol", default: ""
    t.integer "provider_id"
    t.string "provider_name", default: ""
    t.datetime "modification"
    t.index ["modification"], name: "index_nrnp_tables_on_modification"
    t.index ["provider_id"], name: "index_nrnp_tables_on_provider_id"
    t.index ["provider_name"], name: "index_nrnp_tables_on_provider_name"
    t.index ["routing_number"], name: "index_nrnp_tables_on_routing_number"
    t.index ["routing_number_type"], name: "index_nrnp_tables_on_routing_number_type"
    t.index ["zone_ab"], name: "index_nrnp_tables_on_zone_ab"
    t.index ["zone_symbol"], name: "index_nrnp_tables_on_zone_symbol"
  end

  create_table "nspc_tables", force: :cascade do |t|
    t.integer "zone_ab"
    t.integer "number"
    t.integer "provider_id"
    t.string "provider_name", default: ""
    t.datetime "modification"
    t.index ["modification"], name: "index_nspc_tables_on_modification"
    t.index ["number"], name: "index_nspc_tables_on_number"
    t.index ["provider_id"], name: "index_nspc_tables_on_provider_id"
    t.index ["provider_name"], name: "index_nspc_tables_on_provider_name"
    t.index ["zone_ab"], name: "index_nspc_tables_on_zone_ab"
  end

  create_table "plmn_tables", force: :cascade do |t|
    t.string "scope", default: ""
    t.integer "provider_id"
    t.string "provider_name", default: ""
    t.datetime "modification"
    t.string "scope_type", default: ""
    t.index ["modification"], name: "index_plmn_tables_on_modification"
    t.index ["provider_id"], name: "index_plmn_tables_on_provider_id"
    t.index ["provider_name"], name: "index_plmn_tables_on_provider_name"
    t.index ["scope"], name: "index_plmn_tables_on_scope"
    t.index ["scope_type"], name: "index_plmn_tables_on_scope_type"
  end

  create_table "pstn_tables", force: :cascade do |t|
    t.integer "zone_ab"
    t.string "scope", default: ""
    t.string "provider_name", default: ""
    t.integer "provider_id"
    t.string "zone_name", default: ""
    t.string "zone_symbol", default: ""
    t.string "numbering_area", default: ""
    t.datetime "modification"
    t.index ["modification"], name: "index_pstn_tables_on_modification"
    t.index ["numbering_area"], name: "index_pstn_tables_on_numbering_area"
    t.index ["provider_id"], name: "index_pstn_tables_on_provider_id"
    t.index ["provider_name"], name: "index_pstn_tables_on_provider_name"
    t.index ["scope"], name: "index_pstn_tables_on_scope"
    t.index ["zone_ab"], name: "index_pstn_tables_on_zone_ab"
    t.index ["zone_name"], name: "index_pstn_tables_on_zone_name"
    t.index ["zone_symbol"], name: "index_pstn_tables_on_zone_symbol"
  end

  create_table "voip_tables", force: :cascade do |t|
    t.string "scope", default: ""
    t.string "provider_name", default: ""
    t.integer "provider_id"
    t.datetime "modification"
    t.index ["modification"], name: "index_voip_tables_on_modification"
    t.index ["provider_id"], name: "index_voip_tables_on_provider_id"
    t.index ["provider_name"], name: "index_voip_tables_on_provider_name"
    t.index ["scope"], name: "index_voip_tables_on_scope"
  end

end
