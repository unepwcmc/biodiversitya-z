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

ActiveRecord::Schema.define(:version => 20150908132249) do

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "page_order", :default => 0
  end

  create_table "refinery_copywriting_phrase_translations", :force => true do |t|
    t.integer  "refinery_copywriting_phrase_id"
    t.string   "locale",                         :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.text     "value"
  end

  add_index "refinery_copywriting_phrase_translations", ["locale"], :name => "index_copywriting_phrase_translations_on_locale"
  add_index "refinery_copywriting_phrase_translations", ["refinery_copywriting_phrase_id"], :name => "index_copywriting_phrase_translations_on_copywriting_phrase_id"

  create_table "refinery_copywriting_phrases", :force => true do |t|
    t.string   "name"
    t.text     "default"
    t.text     "value"
    t.string   "scope"
    t.integer  "page_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "phrase_type"
    t.date     "last_access_at"
  end

  add_index "refinery_copywriting_phrases", ["name", "scope"], :name => "index_copywriting_phrases_on_name_and_scope"

  create_table "refinery_images", :force => true do |t|
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "refinery_letter_terms", :force => true do |t|
    t.integer "letter_id"
    t.integer "term_id"
  end

  create_table "refinery_page_part_translations", :force => true do |t|
    t.integer  "refinery_page_part_id"
    t.string   "locale",                :null => false
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.text     "body"
  end

  add_index "refinery_page_part_translations", ["locale"], :name => "index_refinery_page_part_translations_on_locale"
  add_index "refinery_page_part_translations", ["refinery_page_part_id"], :name => "index_refinery_page_part_translations_on_refinery_page_part_id"

  create_table "refinery_page_parts", :force => true do |t|
    t.integer  "refinery_page_id"
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "refinery_page_parts", ["id"], :name => "index_refinery_page_parts_on_id"
  add_index "refinery_page_parts", ["refinery_page_id"], :name => "index_refinery_page_parts_on_refinery_page_id"

  create_table "refinery_page_translations", :force => true do |t|
    t.integer  "refinery_page_id"
    t.string   "locale",           :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "title"
    t.string   "custom_slug"
    t.string   "menu_title"
    t.string   "slug"
  end

  add_index "refinery_page_translations", ["locale"], :name => "index_refinery_page_translations_on_locale"
  add_index "refinery_page_translations", ["refinery_page_id"], :name => "index_refinery_page_translations_on_refinery_page_id"

  create_table "refinery_pages", :force => true do |t|
    t.integer  "parent_id"
    t.string   "path"
    t.string   "slug"
    t.boolean  "show_in_menu",        :default => true
    t.string   "link_url"
    t.string   "menu_match"
    t.boolean  "deletable",           :default => true
    t.boolean  "draft",               :default => false
    t.boolean  "skip_to_first_child", :default => false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "view_template"
    t.string   "layout_template"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "show_in_footer"
  end

  add_index "refinery_pages", ["depth"], :name => "index_refinery_pages_on_depth"
  add_index "refinery_pages", ["id"], :name => "index_refinery_pages_on_id"
  add_index "refinery_pages", ["lft"], :name => "index_refinery_pages_on_lft"
  add_index "refinery_pages", ["parent_id"], :name => "index_refinery_pages_on_parent_id"
  add_index "refinery_pages", ["rgt"], :name => "index_refinery_pages_on_rgt"

  create_table "refinery_related_term_associations", :force => true do |t|
    t.integer  "term_id"
    t.integer  "related_term_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "refinery_resources", :force => true do |t|
    t.string   "file_mime_type"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_uid"
    t.string   "file_ext"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "refinery_roles", :force => true do |t|
    t.string "title"
  end

  create_table "refinery_roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "refinery_roles_users", ["role_id", "user_id"], :name => "index_refinery_roles_users_on_role_id_and_user_id"
  add_index "refinery_roles_users", ["user_id", "role_id"], :name => "index_refinery_roles_users_on_user_id_and_role_id"

  create_table "refinery_term_theme_associations", :force => true do |t|
    t.integer  "term_id"
    t.integer  "theme_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "is_master",  :default => false, :null => false
  end

  create_table "refinery_terms", :force => true do |t|
    t.string   "title"
    t.text     "definition"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "acronym"
    t.string   "slug"
    t.string   "definition_title"
    t.integer  "featured_image_id"
    t.string   "caption"
    t.integer  "acronym_id"
    t.integer  "legacy_id"
    t.integer  "legacy_type"
  end

  add_index "refinery_terms", ["acronym_id"], :name => "index_refinery_terms_on_acronym_id"
  add_index "refinery_terms", ["featured_image_id"], :name => "index_refinery_terms_on_featured_image_id"
  add_index "refinery_terms", ["legacy_id"], :name => "index_refinery_terms_on_legacy_id"
  add_index "refinery_terms", ["legacy_type"], :name => "index_refinery_terms_on_legacy_type"
  add_index "refinery_terms", ["slug"], :name => "index_refinery_terms_on_slug", :unique => true

  create_table "refinery_terms_sections", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.integer  "term_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "refinery_terms_themes", :force => true do |t|
    t.string   "title"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "logo_id"
    t.integer  "banner_id"
    t.string   "tagline"
    t.text     "description"
    t.string   "slug"
    t.string   "synopsis"
    t.integer  "icon_id"
    t.string   "image_citation"
    t.integer  "terms_count"
  end

  add_index "refinery_terms_themes", ["depth"], :name => "index_refinery_terms_themes_on_depth"
  add_index "refinery_terms_themes", ["icon_id"], :name => "index_refinery_terms_themes_on_icon_id"
  add_index "refinery_terms_themes", ["lft"], :name => "index_refinery_terms_themes_on_lft"
  add_index "refinery_terms_themes", ["parent_id"], :name => "index_refinery_terms_themes_on_parent_id"
  add_index "refinery_terms_themes", ["rgt"], :name => "index_refinery_terms_themes_on_rgt"
  add_index "refinery_terms_themes", ["slug"], :name => "index_refinery_terms_themes_on_slug", :unique => true

  create_table "refinery_terms_urls", :force => true do |t|
    t.string   "title",       :limit => 1000
    t.string   "url",         :limit => 1000
    t.integer  "position"
    t.string   "type"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "term_id"
    t.string   "description", :limit => 1000
  end

  add_index "refinery_terms_urls", ["position"], :name => "index_refinery_terms_urls_on_position"
  add_index "refinery_terms_urls", ["term_id"], :name => "index_refinery_terms_urls_on_term_id"

  create_table "refinery_theme_letters", :force => true do |t|
    t.string   "letter"
    t.integer  "letter_terms_count", :default => 0, :null => false
    t.integer  "theme_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "refinery_user_plugins", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "position"
  end

  add_index "refinery_user_plugins", ["name"], :name => "index_refinery_user_plugins_on_name"
  add_index "refinery_user_plugins", ["user_id", "name"], :name => "index_refinery_user_plugins_on_user_id_and_name", :unique => true

  create_table "refinery_users", :force => true do |t|
    t.string   "username",               :null => false
    t.string   "email",                  :null => false
    t.string   "encrypted_password",     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count"
    t.datetime "remember_created_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "slug"
  end

  add_index "refinery_users", ["id"], :name => "index_refinery_users_on_id"
  add_index "refinery_users", ["slug"], :name => "index_refinery_users_on_slug"

  create_table "search_suggestions", :force => true do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "seo_meta", :force => true do |t|
    t.integer  "seo_meta_id"
    t.string   "seo_meta_type"
    t.string   "browser_title"
    t.text     "meta_description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "seo_meta", ["id"], :name => "index_seo_meta_on_id"
  add_index "seo_meta", ["seo_meta_id", "seo_meta_type"], :name => "id_type_index_on_seo_meta"

  create_table "term_groupings", :force => true do |t|
    t.string   "name",            :null => false
    t.text     "description"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "strap_line"
    t.integer  "illustration_id"
    t.string   "strapline"
  end

  create_table "term_names", :force => true do |t|
    t.string   "name"
    t.integer  "term_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "primary"
  end

  create_table "term_term_groupings", :force => true do |t|
    t.integer  "term_id"
    t.integer  "term_grouping_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terms", :force => true do |t|
    t.string   "term",                :null => false
    t.text     "definition",          :null => false
    t.text     "notes_on_definition"
    t.text     "further_definitions"
    t.text     "key_points"
    t.text     "outline"
    t.text     "context"
    t.text     "links"
    t.text     "references"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_citation"
    t.integer  "primary_name_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "tool_links", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "link_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
