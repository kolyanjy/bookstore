
ActiveRecord::Schema.define(version: 2019_05_26_160104) do

  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.integer "quantity"
    t.text "description"
    t.string "dimensions"
    t.integer "year"
    t.string "materials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
