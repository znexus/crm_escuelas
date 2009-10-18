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

ActiveRecord::Schema.define(:version => 20090507205521) do

  create_table "addresses", :force => true do |t|
    t.integer  "addressable_id",   :null => false
    t.string   "addressable_type", :null => false
    t.string   "street_1",         :null => false
    t.string   "street_2"
    t.string   "city",             :null => false
    t.integer  "region_id"
    t.string   "custom_region"
    t.string   "postal_code",      :null => false
    t.string   "telefonos"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email1"
    t.string   "email2"
  end

  create_table "adjuntos", :force => true do |t|
    t.string  "adjuntable_type"
    t.integer "adjuntable_id"
    t.integer "parent_id"
    t.string  "content_type"
    t.string  "filename"
    t.string  "thumbnail"
    t.integer "size"
    t.integer "width"
    t.integer "height"
  end

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "changes"
    t.integer  "version",        :default => 0
    t.datetime "created_at"
  end

  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "comentarios", :force => true do |t|
    t.text     "texto"
    t.integer  "comentable_id"
    t.string   "comentable_type"
    t.datetime "recordatorio"
    t.string   "tipo"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "monto",           :precision => 8, :scale => 2
    t.string   "moneda"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
  end

  add_index "comentarios", ["comentable_type", "comentable_id"], :name => "index_comentarios_on_comentable_type_and_comentable_id"
  add_index "comentarios", ["user_id"], :name => "index_comentarios_on_user_id"

  create_table "countries", :force => true do |t|
    t.string  "name"
    t.string  "official_name"
    t.integer "numeric_code"
    t.string  "common_name"
    t.string  "alpha_2_code"
    t.string  "alpha_3_code"
  end

  create_table "emails", :force => true do |t|
    t.string   "from"
    t.string   "to"
    t.integer  "last_send_attempt", :default => 0
    t.text     "mail"
    t.datetime "created_on"
  end

  create_table "familias", :force => true do |t|
    t.integer  "padre_id"
    t.integer  "madre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "familias", ["madre_id"], :name => "index_familias_on_madre_id"
  add_index "familias", ["padre_id"], :name => "index_familias_on_padre_id"

  create_table "institucions", :force => true do |t|
    t.string   "nombre"
    t.string   "ruc"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "institucions", ["ruc"], :name => "index_institucions_on_ruc"

  create_table "listas", :force => true do |t|
    t.integer  "user_id"
    t.string   "listable_type"
    t.integer  "listable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enviado",       :default => false
  end

  create_table "personas", :force => true do |t|
    t.string   "nombre"
    t.string   "apepat"
    t.string   "apemat"
    t.integer  "familia_id"
    t.integer  "titulo_id"
    t.string   "sexo"
    t.date     "nacimiento"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "etiquetas"
    t.boolean  "asistcard"
  end

  add_index "personas", ["apemat"], :name => "index_personas_on_apemat"
  add_index "personas", ["apepat"], :name => "index_personas_on_apepat"
  add_index "personas", ["familia_id"], :name => "index_personas_on_familia_id"
  add_index "personas", ["nombre"], :name => "index_personas_on_nombre"
  add_index "personas", ["titulo_id"], :name => "index_personas_on_titulo_id"

  create_table "plantillas", :force => true do |t|
    t.string   "nombre"
    t.text     "texto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.integer "country_id"
    t.string  "group"
    t.string  "name"
    t.string  "abbreviation"
    t.string  "code"
    t.string  "code2"
    t.string  "tipo"
  end

  add_index "regions", ["country_id"], :name => "index_regions_on_country_id"

  create_table "relacions", :force => true do |t|
    t.integer  "persona_id"
    t.integer  "institucion_id"
    t.integer  "tipo_vinculo_id"
    t.string   "nombre"
    t.integer  "year"
    t.string   "gradoseccion"
    t.string   "email"
    t.string   "telefono"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relacions", ["institucion_id"], :name => "index_relacions_on_institucion_id"
  add_index "relacions", ["persona_id"], :name => "index_relacions_on_persona_id"
  add_index "relacions", ["tipo_vinculo_id"], :name => "index_relacions_on_tipo_vinculo_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "tipo_vinculos", :force => true do |t|
    t.string   "nombre"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "titulos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "nombre"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
