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

ActiveRecord::Schema.define(:version => 20130721035346) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.boolean  "current"
    t.integer  "bs_category_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "bs_categories", :force => true do |t|
    t.string   "name"
    t.integer  "debit_impact"
    t.integer  "credit_impact"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "sub_account_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "projections", :force => true do |t|
    t.decimal  "amount"
    t.boolean  "success"
    t.integer  "sub_account_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "month"
    t.integer  "year"
  end

  create_table "sub_accounts", :force => true do |t|
    t.string   "name"
    t.integer  "account_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transaction_items", :force => true do |t|
    t.decimal  "amount"
    t.boolean  "debit"
    t.integer  "sub_account_id"
    t.integer  "transaction_id"
    t.integer  "category_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "transactions", :force => true do |t|
    t.text     "memo"
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
