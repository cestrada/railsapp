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

ActiveRecord::Schema.define(:version => 20150412003124) do

  create_table "boxes", :force => true do |t|
    t.integer  "box_number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "boxes", ["box_number"], :name => "index_boxes_on_box_number"

  create_table "cofis", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cofis", ["name"], :name => "index_cofis_on_name"

  create_table "credited_people", :force => true do |t|
    t.integer "credit_number"
    t.string  "name"
    t.string  "last_name"
    t.string  "mother_last_name"
  end

  add_index "credited_people", ["credit_number"], :name => "index_credited_people_on_credit_number"
  add_index "credited_people", ["last_name"], :name => "index_credited_people_on_last_name"
  add_index "credited_people", ["mother_last_name"], :name => "index_credited_people_on_mother_last_name"
  add_index "credited_people", ["name"], :name => "index_credited_people_on_name"

  create_table "document_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "document_types", ["name"], :name => "index_document_types_on_name"

  create_table "documents", :force => true do |t|
    t.integer  "box_id"
    t.integer  "document_type_id"
    t.integer  "numero_credito"
    t.integer  "numero_escritura"
    t.date     "fecha_escritura"
    t.string   "nombre_notario"
    t.integer  "numero_notaria"
    t.integer  "entity_id"
    t.string   "nombre_acreditado"
    t.string   "paterno_acreditado"
    t.string   "materno_acreditado"
    t.string   "nombre_coacreditado_1"
    t.string   "paterno_coacreditado_1"
    t.string   "materno_coacreditado_1"
    t.string   "nombre_coacreditado_2"
    t.string   "paterno_coacreditado_2"
    t.string   "materno_coacreditado_2"
    t.string   "nombre_coacreditado_3"
    t.string   "paterno_coacreditado_3"
    t.string   "materno_coacreditado_3"
    t.integer  "originator_id"
    t.integer  "cofi_id"
    t.string   "calle"
    t.string   "colonia"
    t.string   "municipio"
    t.integer  "estado_id"
    t.integer  "jurisdiccion_id"
    t.string   "folio_real_rpp"
    t.string   "seccion_rpp"
    t.string   "libro_rpp"
    t.string   "volumen_rpp"
    t.string   "partida_rpp"
    t.date     "fecha_rpp"
    t.integer  "entidad_id"
    t.date     "fecha_avaluo"
    t.decimal  "monto_avaluo",           :precision => 10, :scale => 0
    t.string   "nombre_archivo"
    t.integer  "numero_demanda"
    t.integer  "numero_expediente"
    t.integer  "numero_juzgado"
    t.string   "ubicacion_juzgado"
    t.date     "fecha_auto_admisorio"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "documents", ["box_id"], :name => "index_documents_on_box_id"
  add_index "documents", ["cofi_id"], :name => "index_documents_on_cofi_id"
  add_index "documents", ["document_type_id"], :name => "index_documents_on_document_type_id"
  add_index "documents", ["entidad_id"], :name => "index_documents_on_entidad_id"
  add_index "documents", ["entity_id"], :name => "index_documents_on_entity_id"
  add_index "documents", ["estado_id"], :name => "index_documents_on_estado_id"
  add_index "documents", ["jurisdiccion_id"], :name => "index_documents_on_jurisdiccion_id"
  add_index "documents", ["numero_credito"], :name => "index_documents_on_numero_credito"
  add_index "documents", ["numero_demanda"], :name => "index_documents_on_numero_demanda"
  add_index "documents", ["numero_escritura"], :name => "index_documents_on_numero_escritura"
  add_index "documents", ["numero_expediente"], :name => "index_documents_on_numero_expediente"
  add_index "documents", ["numero_juzgado"], :name => "index_documents_on_numero_juzgado"
  add_index "documents", ["numero_notaria"], :name => "index_documents_on_numero_notaria"
  add_index "documents", ["originator_id"], :name => "index_documents_on_originator_id"

  create_table "entidads", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "entidads", ["name"], :name => "index_entidads_on_name"

  create_table "entities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "entities", ["name"], :name => "index_entities_on_name"

  create_table "estados", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "estados", ["name"], :name => "index_estados_on_name"

  create_table "jurisdiccions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "jurisdiccions", ["name"], :name => "index_jurisdiccions_on_name"

  create_table "originators", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "originators", ["name"], :name => "index_originators_on_name"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "user_sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_sessions", ["session_id"], :name => "index_user_sessions_on_session_id"
  add_index "user_sessions", ["updated_at"], :name => "index_user_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "username",               :default => "",    :null => false
    t.string   "crypted_password",                          :null => false
    t.string   "password_salt",                             :null => false
    t.string   "email",                                     :null => false
    t.boolean  "is_logged",              :default => false, :null => false
    t.integer  "login_count",            :default => 0,     :null => false
    t.integer  "failed_login_count",     :default => 0,     :null => false
    t.integer  "role_id",                :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "persistence_token",                         :null => false
    t.string   "single_access_token",                       :null => false
    t.string   "perishable_token",                          :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["role_id"], :name => "index_users_on_role_id"
  add_index "users", ["username"], :name => "index_users_on_username"

end
