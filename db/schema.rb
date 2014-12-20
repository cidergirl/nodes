# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141220085013) do

  create_table "affiliations", :force => true do |t|
    t.integer  "node_id",    :null => false
    t.integer  "group_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "affiliations", ["group_id", "node_id"], :name => "index_affiliations_on_group_id_and_node_id"
  add_index "affiliations", ["node_id", "group_id"], :name => "index_affiliations_on_node_id_and_group_id", :unique => true

  create_table "connections", :force => true do |t|
    t.integer  "node_id",       :null => false
    t.integer  "other_node_id", :null => false
    t.integer  "kind_mask"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "connections", ["node_id", "other_node_id"], :name => "index_connections_on_node_id_and_other_node_id", :unique => true
  add_index "connections", ["other_node_id", "node_id"], :name => "index_connections_on_other_node_id_and_node_id"

  create_table "groups", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "kind_mask"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "groups", ["kind_mask"], :name => "index_groups_on_kind_mask"
  add_index "groups", ["name"], :name => "index_groups_on_name", :unique => true

  create_table "nodes", :force => true do |t|
    t.string   "first_name",  :null => false
    t.string   "last_name",   :null => false
    t.string   "role"
    t.integer  "kind_mask"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "nodes", ["first_name"], :name => "index_nodes_on_first_name"
  add_index "nodes", ["kind_mask"], :name => "index_nodes_on_kind_mask"
  add_index "nodes", ["last_name"], :name => "index_nodes_on_last_name"

end
