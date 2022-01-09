# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_27_200522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.bigint "management_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["management_id"], name: "index_areas_on_management_id"
  end

  create_table "careers", force: :cascade do |t|
    t.string "name"
    t.bigint "faculty_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["faculty_id"], name: "index_careers_on_faculty_id"
  end

  create_table "evaluated_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "evaluation_id", null: false
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["evaluation_id"], name: "index_evaluated_users_on_evaluation_id"
    t.index ["user_id"], name: "index_evaluated_users_on_user_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.date "released_at"
    t.date "finished_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "managements", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "resume"
    t.date "released_at"
    t.date "finished_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "parent_id"
    t.index ["name"], name: "index_projects_on_name", unique: true
    t.index ["parent_id"], name: "index_projects_on_parent_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_projects", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_user_projects_on_project_id"
    t.index ["user_id"], name: "index_user_projects_on_user_id"
  end

  create_table "user_requests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "request_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["request_id"], name: "index_user_requests_on_request_id"
    t.index ["user_id"], name: "index_user_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_fb", null: false
    t.string "email", default: "", null: false
    t.string "username", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "phone"
    t.integer "dni"
    t.string "address"
    t.date "birthday"
    t.integer "unmsm_code"
    t.integer "cicle"
    t.date "registered_at"
    t.bigint "area_id"
    t.bigint "career_id"
    t.integer "role"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_users_on_area_id"
    t.index ["career_id"], name: "index_users_on_career_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["user_fb"], name: "index_users_on_user_fb", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "areas", "managements"
  add_foreign_key "careers", "faculties"
  add_foreign_key "evaluated_users", "evaluations"
  add_foreign_key "evaluated_users", "users"
  add_foreign_key "projects", "projects", column: "parent_id"
  add_foreign_key "user_projects", "projects"
  add_foreign_key "user_projects", "users"
  add_foreign_key "user_requests", "requests"
  add_foreign_key "user_requests", "users"
  add_foreign_key "users", "areas"
  add_foreign_key "users", "careers"
end
