# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100322155505) do

  create_table "bin", :force => true do |t|
    t.string  "uppflettiord",       :limit => 40
    t.integer "wordid"
    t.string  "ordflokkur",         :limit => 60
    t.string  "hluti",              :limit => 5
    t.string  "beygingarmynd",      :limit => 40
    t.string  "greiningarstrengur", :limit => 40
  end

  add_index "bin", ["hluti"], :name => "index_bin_on_hluti"
  add_index "bin", ["uppflettiord"], :name => "index_bin_on_uppflettiord"
  add_index "bin", ["wordid"], :name => "index_bin_on_wordid"

end
