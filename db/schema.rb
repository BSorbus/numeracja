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
    t.integer "operator"
    t.string "operator_name"
    t.integer "zone"
    t.string "zone_name"
    t.string "zone_symbol"
    t.datetime "modification"
    t.index ["modification"], name: "index_aus_tables_on_modification"
    t.index ["number"], name: "index_aus_tables_on_number"
    t.index ["operator"], name: "index_aus_tables_on_operator"
    t.index ["operator_name"], name: "index_aus_tables_on_operator_name"
    t.index ["zone"], name: "index_aus_tables_on_zone"
    t.index ["zone_name"], name: "index_aus_tables_on_zone_name"
    t.index ["zone_symbol"], name: "index_aus_tables_on_zone_symbol"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "number", default: ""
    t.date "date_of_issue"
    t.date "valid_to"
    t.string "call_sign", default: ""
    t.string "category", default: ""
    t.integer "transmitter_power"
    t.string "enduser_name", default: ""
    t.string "enduser_city", default: ""
    t.string "enduser_street", default: ""
    t.string "enduser_house", default: ""
    t.string "enduser_number", default: ""
    t.string "applicant_name", default: ""
    t.string "applicant_city", default: ""
    t.string "applicant_street", default: ""
    t.string "applicant_house", default: ""
    t.string "applicant_number", default: ""
    t.string "station_city", default: ""
    t.string "station_street", default: ""
    t.string "station_house", default: ""
    t.string "station_number", default: ""
    t.float "lat"
    t.float "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_city"], name: "index_clubs_on_applicant_city"
    t.index ["applicant_house"], name: "index_clubs_on_applicant_house"
    t.index ["applicant_name"], name: "index_clubs_on_applicant_name"
    t.index ["applicant_number"], name: "index_clubs_on_applicant_number"
    t.index ["applicant_street"], name: "index_clubs_on_applicant_street"
    t.index ["call_sign"], name: "index_clubs_on_call_sign"
    t.index ["category"], name: "index_clubs_on_category"
    t.index ["date_of_issue"], name: "index_clubs_on_date_of_issue"
    t.index ["enduser_city"], name: "index_clubs_on_enduser_city"
    t.index ["enduser_house"], name: "index_clubs_on_enduser_house"
    t.index ["enduser_name"], name: "index_clubs_on_enduser_name"
    t.index ["enduser_number"], name: "index_clubs_on_enduser_number"
    t.index ["enduser_street"], name: "index_clubs_on_enduser_street"
    t.index ["lat"], name: "index_clubs_on_lat"
    t.index ["lng"], name: "index_clubs_on_lng"
    t.index ["number"], name: "index_clubs_on_number"
    t.index ["station_city"], name: "index_clubs_on_station_city"
    t.index ["station_house"], name: "index_clubs_on_station_house"
    t.index ["station_number"], name: "index_clubs_on_station_number"
    t.index ["station_street"], name: "index_clubs_on_station_street"
    t.index ["transmitter_power"], name: "index_clubs_on_transmitter_power"
    t.index ["valid_to"], name: "index_clubs_on_valid_to"
  end

  create_table "hesc_tables", force: :cascade do |t|
    t.integer "number"
    t.integer "operator"
    t.string "operator_name"
    t.datetime "modification"
    t.string "service_description"
    t.string "entity_providing_services"
  end

  create_table "ispc_tables", force: :cascade do |t|
    t.string "number"
    t.integer "operator"
    t.string "operator_name"
    t.string "location"
    t.datetime "modification"
    t.index ["location"], name: "index_ispc_tables_on_location"
    t.index ["modification"], name: "index_ispc_tables_on_modification"
    t.index ["number"], name: "index_ispc_tables_on_number"
    t.index ["operator"], name: "index_ispc_tables_on_operator"
    t.index ["operator_name"], name: "index_ispc_tables_on_operator_name"
  end

  create_table "mnc_tables", force: :cascade do |t|
    t.string "number"
    t.integer "operator"
    t.string "operator_name"
    t.string "network"
    t.datetime "modification"
    t.index ["modification"], name: "index_mnc_tables_on_modification"
    t.index ["network"], name: "index_mnc_tables_on_network"
    t.index ["number"], name: "index_mnc_tables_on_number"
    t.index ["operator"], name: "index_mnc_tables_on_operator"
    t.index ["operator_name"], name: "index_mnc_tables_on_operator_name"
  end

  create_table "ndin_tables", force: :cascade do |t|
    t.string "scope"
    t.string "operator_name"
    t.integer "operator"
    t.string "service_type_name"
    t.datetime "modification"
    t.index ["modification"], name: "index_ndin_tables_on_modification"
    t.index ["operator"], name: "index_ndin_tables_on_operator"
    t.index ["operator_name"], name: "index_ndin_tables_on_operator_name"
    t.index ["scope"], name: "index_ndin_tables_on_scope"
    t.index ["service_type_name"], name: "index_ndin_tables_on_service_type_name"
  end

  create_table "nds_tables", force: :cascade do |t|
    t.integer "number"
    t.integer "operator"
    t.string "operator_name"
    t.datetime "modification"
    t.index ["modification"], name: "index_nds_tables_on_modification"
    t.index ["number"], name: "index_nds_tables_on_number"
    t.index ["operator"], name: "index_nds_tables_on_operator"
    t.index ["operator_name"], name: "index_nds_tables_on_operator_name"
  end

  create_table "ndsi_tables", force: :cascade do |t|
    t.integer "number"
    t.integer "operator"
    t.string "operator_name"
    t.integer "number_type"
    t.datetime "modification"
    t.index ["modification"], name: "index_ndsi_tables_on_modification"
    t.index ["number"], name: "index_ndsi_tables_on_number"
    t.index ["number_type"], name: "index_ndsi_tables_on_number_type"
    t.index ["operator"], name: "index_ndsi_tables_on_operator"
    t.index ["operator_name"], name: "index_ndsi_tables_on_operator_name"
  end

  create_table "nrnp_tables", force: :cascade do |t|
    t.string "routing_number"
    t.string "routing_number_type"
    t.string "zone"
    t.string "zone_symbol"
    t.integer "operator"
    t.string "operator_name"
    t.datetime "modification"
    t.index ["modification"], name: "index_nrnp_tables_on_modification"
    t.index ["operator"], name: "index_nrnp_tables_on_operator"
    t.index ["operator_name"], name: "index_nrnp_tables_on_operator_name"
    t.index ["routing_number"], name: "index_nrnp_tables_on_routing_number"
    t.index ["routing_number_type"], name: "index_nrnp_tables_on_routing_number_type"
    t.index ["zone"], name: "index_nrnp_tables_on_zone"
    t.index ["zone_symbol"], name: "index_nrnp_tables_on_zone_symbol"
  end

  create_table "nspc_tables", force: :cascade do |t|
    t.integer "zone"
    t.integer "number"
    t.integer "operator"
    t.string "operator_name"
    t.datetime "modification"
    t.index ["modification"], name: "index_nspc_tables_on_modification"
    t.index ["number"], name: "index_nspc_tables_on_number"
    t.index ["operator"], name: "index_nspc_tables_on_operator"
    t.index ["operator_name"], name: "index_nspc_tables_on_operator_name"
    t.index ["zone"], name: "index_nspc_tables_on_zone"
  end

  create_table "plmn_tables", force: :cascade do |t|
    t.string "scope"
    t.integer "operator"
    t.string "operator_name"
    t.datetime "modification"
    t.string "scope_type"
    t.index ["modification"], name: "index_plmn_tables_on_modification"
    t.index ["operator"], name: "index_plmn_tables_on_operator"
    t.index ["operator_name"], name: "index_plmn_tables_on_operator_name"
    t.index ["scope"], name: "index_plmn_tables_on_scope"
    t.index ["scope_type"], name: "index_plmn_tables_on_scope_type"
  end

  create_table "pstn_tables", force: :cascade do |t|
    t.integer "zone"
    t.string "scope"
    t.string "operator_name"
    t.integer "operator"
    t.string "zone_name"
    t.string "zone_symbol"
    t.string "numbering_area"
    t.datetime "modification"
    t.index ["modification"], name: "index_pstn_tables_on_modification"
    t.index ["numbering_area"], name: "index_pstn_tables_on_numbering_area"
    t.index ["operator"], name: "index_pstn_tables_on_operator"
    t.index ["operator_name"], name: "index_pstn_tables_on_operator_name"
    t.index ["scope"], name: "index_pstn_tables_on_scope"
    t.index ["zone"], name: "index_pstn_tables_on_zone"
    t.index ["zone_name"], name: "index_pstn_tables_on_zone_name"
    t.index ["zone_symbol"], name: "index_pstn_tables_on_zone_symbol"
  end

  create_table "voip_tables", force: :cascade do |t|
    t.string "scope"
    t.string "operator_name"
    t.integer "operator"
    t.datetime "modification"
  end

end
