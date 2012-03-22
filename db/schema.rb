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

ActiveRecord::Schema.define(:version => 20120322124607) do

  create_table "addresses", :force => true do |t|
    t.string   "address_type"
    t.string   "line1"
    t.string   "line2"
    t.integer  "zip_id"
    t.string   "country"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "antecedents", :force => true do |t|
    t.string   "antecedent_type"
    t.string   "parent"
    t.integer  "antecedentable_id"
    t.string   "antecedentable_type"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "bilan_sanguins", :force => true do |t|
    t.date     "date_of_bilan"
    t.string   "glycemie"
    t.string   "tryglycerides"
    t.string   "cholesterol"
    t.string   "hdl"
    t.string   "ldl"
    t.string   "t4l"
    t.string   "tsh"
    t.integer  "bilanable_id"
    t.string   "bilanable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "questionnaire_id"
    t.integer  "fusion_group_id"
    t.integer  "fusion_question_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "comments", :force => true do |t|
    t.string   "comment_type"
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "diagnostics", :force => true do |t|
    t.date     "date_du_diagnostic"
    t.date     "date_du_prochain_diagnostic"
    t.string   "diagnostic_type"
    t.boolean  "anomalie_activite_physique"
    t.boolean  "anomalie_temps_ecran"
    t.boolean  "anomalie_grignotage"
    t.boolean  "anomalie_consommation_soda"
    t.boolean  "anomalie_alimentation_trop_riche"
    t.boolean  "anomalie_alimentation_fruits_legumes"
    t.boolean  "anomalie_composition_repas"
    t.boolean  "anomalie_contexte_repas"
    t.boolean  "anomalie_repartition_repas"
    t.string   "motivation_famille"
    t.string   "motivation_enfant"
    t.integer  "diagnosticable_id"
    t.string   "diagnosticable_type"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "emails", :force => true do |t|
    t.string   "email_type"
    t.string   "email"
    t.integer  "emailable_id"
    t.string   "emailable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "groupe_enfants", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groupe_parents", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "medecins", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "specialty"
    t.boolean  "organization_member"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "medecins_profils", :id => false, :force => true do |t|
    t.integer "profil_id"
    t.integer "medecin_id"
  end

  create_table "mesures", :force => true do |t|
    t.date     "date_of_mesure"
    t.float    "poids"
    t.float    "taille"
    t.integer  "tour_de_taille"
    t.integer  "tour_de_hanches"
    t.float    "z_score"
    t.string   "degre_obesite"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "objectifs", :force => true do |t|
    t.string   "objectif_type"
    t.text     "objectif"
    t.boolean  "atteint"
    t.integer  "objectivable_id"
    t.string   "objectivable_type"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "phones", :force => true do |t|
    t.string   "phone_type"
    t.string   "number"
    t.integer  "phonable_id"
    t.string   "phonable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "profil_mesures", :force => true do |t|
    t.integer  "profil_id"
    t.date     "date_of_mesure"
    t.float    "poids"
    t.float    "taille"
    t.integer  "tour_de_taille"
    t.integer  "tour_de_hanches"
    t.float    "z_score"
    t.string   "degre_obesite"
    t.integer  "position"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "profils", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.date     "birthdate"
    t.string   "classroom"
    t.integer  "school_id"
    t.integer  "medecin_id"
    t.integer  "user_id"
    t.integer  "groupe_enfant_id"
    t.float    "taille_naissance"
    t.float    "poids_naissance"
    t.integer  "terme_sa"
    t.boolean  "rciu"
    t.boolean  "pma"
    t.boolean  "diabete_gestationnel"
    t.boolean  "allaitement"
    t.float    "duree_allaitement"
    t.boolean  "rebond_ponderal_precoce"
    t.integer  "age_obesite"
    t.string   "facteur_declenchant"
    t.boolean  "prise_en_charge_anterieure"
    t.boolean  "redoublement"
    t.string   "situation_maritale_des_parents"
    t.integer  "fratrie"
    t.integer  "rang_dans_la_fratrie"
    t.integer  "fratrie_en_surpoids"
    t.integer  "habitant_du_foyer"
    t.string   "type_de_logement"
    t.integer  "television"
    t.integer  "ordinateur"
    t.boolean  "parabole"
    t.boolean  "internet"
    t.string   "corticoide"
    t.string   "antihistaminique"
    t.string   "antiepileptique"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.date     "date_inclusion"
  end

  create_table "profils_seance_enfants", :id => false, :force => true do |t|
    t.integer "seance_enfant_id"
    t.integer "profil_id"
  end

  create_table "profils_tuteurs", :id => false, :force => true do |t|
    t.integer "profil_id"
    t.integer "tuteur_id"
  end

  create_table "questionnaires", :force => true do |t|
    t.text     "content"
    t.integer  "category_id"
    t.integer  "profil_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "schools", :force => true do |t|
    t.string   "schooltype"
    t.string   "name"
    t.integer  "zip_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "seance_enfants", :force => true do |t|
    t.date     "date_of_seance"
    t.string   "theme"
    t.integer  "groupe_enfant_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "seance_parents", :force => true do |t|
    t.date     "date_of_seance"
    t.string   "theme"
    t.integer  "groupe_parent_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "seance_parents_tuteurs", :id => false, :force => true do |t|
    t.integer "seance_parent_id"
    t.integer "tuteur_id"
  end

  create_table "tuteur_mesures", :force => true do |t|
    t.integer  "tuteur_id"
    t.date     "date_of_mesure"
    t.float    "poids"
    t.float    "taille"
    t.integer  "tour_de_taille"
    t.integer  "tour_de_hanches"
    t.float    "z_score"
    t.string   "degre_obesite"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "tuteurs", :force => true do |t|
    t.string   "tuteur_type"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.string   "profession"
    t.integer  "groupe_parent_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "intitule_profession"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

  create_table "zips", :force => true do |t|
    t.string   "zipcode"
    t.string   "city"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
