class InitialStructure < ActiveRecord::Migration
  def up
    create_table "buildings", force: :cascade do |t|
      t.integer  "city_id",       limit: 4,               null: false
      t.integer  "building_type", limit: 4,               null: false
      t.string   "lvl",           limit: 2, default: "0", null: false
      t.string   "loc",           limit: 2, default: "0", null: false
      t.datetime "finished_at"
    end

    add_index "buildings", ["city_id", "loc"], name: "city_id_loc", unique: true, using: :btree

    create_table "cities", force: :cascade do |t|
      t.integer  "player_id",     limit: 4,                       null: false
      t.string   "name",          limit: 32, default: "New city", null: false
      t.float    "lat",           limit: 24
      t.float    "lng",           limit: 24
      t.datetime "created_at",                                    null: false
      t.datetime "updated_at"
      t.datetime "calculated_at"
      t.integer  "resA",          limit: 4,  default: 0,          null: false
      t.integer  "resB",          limit: 4,  default: 0,          null: false
      t.integer  "resC",          limit: 4,  default: 0,          null: false
      t.integer  "resD",          limit: 4,  default: 0,          null: false
      t.integer  "resE",          limit: 4,  default: 0,          null: false
    end

    create_table "options", force: :cascade do |t|
      t.integer "optiontype_id", limit: 4,                   null: false
      t.string  "value",         limit: 100,                 null: false
      t.text    "description",   limit: 65535
      t.float   "rpmA",          limit: 24,    default: 0.0, null: false
      t.float   "rpmB",          limit: 24,    default: 0.0, null: false
      t.float   "rpmC",          limit: 24,    default: 0.0, null: false
      t.float   "rpmD",          limit: 24,    default: 0.0, null: false
      t.float   "rpmE",          limit: 24,    default: 0.0, null: false
      t.float   "modifier",      limit: 24,    default: 0.0, null: false
    end

    create_table "optiontypes", force: :cascade do |t|
      t.string "value", limit: 100, null: false
    end

    create_table "players", force: :cascade do |t|
      t.integer  "user_id",    limit: 4,     null: false
      t.datetime "created_at",               null: false
      t.datetime "updated_at"
      t.text     "info",       limit: 65535
    end
  end
end
