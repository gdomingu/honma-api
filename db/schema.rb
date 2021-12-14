# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_12_204253) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "dialects", force: :cascade do |t|
    t.string "name_en"
    t.string "name_jp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "start_btn_text"
    t.string "next_btn_text"
    t.string "complete_btn_text"
    t.text "description"
  end

  create_table "examples", force: :cascade do |t|
    t.string "language"
    t.string "sentence1"
    t.string "sentence2"
    t.bigint "grammar_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["grammar_id"], name: "index_examples_on_grammar_id"
  end

  create_table "grammars", force: :cascade do |t|
    t.string "description"
    t.integer "position"
    t.bigint "dialect_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "label"
    t.integer "commonness"
    t.index ["dialect_id"], name: "index_grammars_on_dialect_id"
  end

  create_table "place_infos", force: :cascade do |t|
    t.string "name_jp"
    t.string "name_en"
    t.string "img_url"
    t.float "latitude"
    t.float "longtitude"
    t.bigint "dialect_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
    t.text "description"
    t.index ["dialect_id"], name: "index_place_infos_on_dialect_id"
  end

  create_table "quiz_completions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "quiz_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "index_quiz_completions_on_quiz_id"
    t.index ["user_id"], name: "index_quiz_completions_on_user_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.text "tokyo"
    t.text "answer"
    t.bigint "grammar_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["grammar_id"], name: "index_quizzes_on_grammar_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "examples", "grammars"
  add_foreign_key "grammars", "dialects"
  add_foreign_key "place_infos", "dialects"
  add_foreign_key "quiz_completions", "quizzes"
  add_foreign_key "quiz_completions", "users"
  add_foreign_key "quizzes", "grammars"
end
