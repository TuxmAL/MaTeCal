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

ActiveRecord::Schema.define(:version => 20101110201209) do

  create_table "agenti", :force => true do |t|
    t.string   "cognome",     :limit => 30,                :null => false
    t.string   "nome",        :limit => 25,                :null => false
    t.string   "via",         :limit => 40,                :null => false
    t.string   "citta",       :limit => 50,                :null => false
    t.string   "provincia",   :limit => 2,                 :null => false
    t.string   "cap",         :limit => 5,                 :null => false
    t.integer  "zona_id",                                  :null => false
    t.string   "telefono1",   :limit => 15
    t.string   "telefono2",   :limit => 15
    t.string   "telefono3",   :limit => 15
    t.string   "fax",         :limit => 30
    t.string   "codfis_piva", :limit => 15,                :null => false
    t.integer  "provvigione",               :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agenti", ["cognome", "nome"], :name => "cognome_nome"
  add_index "agenti", ["id"], :name => "primarykey", :unique => true

  create_table "bolle", :force => true do |t|
    t.integer  "numero",                         :null => false
    t.integer  "anno",                           :null => false
    t.datetime "data",                           :null => false
    t.integer  "provvigione"
    t.integer  "agenti_id"
    t.integer  "clienti_id",                     :null => false
    t.integer  "destinazioni_id"
    t.integer  "vettori_id"
    t.integer  "mod_pag_id",                     :null => false
    t.integer  "causali_id",                     :null => false
    t.integer  "trasporto",       :default => 0, :null => false
    t.integer  "colli",           :default => 0, :null => false
    t.integer  "aspetto",         :default => 0, :null => false
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bolle", ["anno", "numero"], :name => "Per numero", :unique => true
  add_index "bolle", ["clienti_id", "destinazioni_id"], :name => "Destinazione", :unique => true
  add_index "bolle", ["data"], :name => "Per data"
  add_index "bolle", ["id"], :name => "PrimaryKey", :unique => true
  add_index "bolle", ["vettori_id"], :name => "BolleIDVettore"

  create_table "campagne", :force => true do |t|
    t.string   "descrizione", :limit => 50, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campagne", ["id"], :name => "campagna", :unique => true

  create_table "causali", :force => true do |t|
    t.string   "causale",    :limit => 35, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "causali", ["id"], :name => "causale", :unique => true

  create_table "clienti", :force => true do |t|
    t.string   "ragione_sociale", :limit => 50,  :null => false
    t.string   "via",             :limit => 40,  :null => false
    t.string   "citta",           :limit => 50,  :null => false
    t.string   "provincia",       :limit => 2,   :null => false
    t.string   "cap",             :limit => 5,   :null => false
    t.integer  "zona_id",                        :null => false
    t.string   "telefono1",       :limit => 15
    t.string   "telefono2",       :limit => 15
    t.string   "telefono3",       :limit => 15
    t.string   "fax",             :limit => 30
    t.string   "codfis_piva",     :limit => 16,  :null => false
    t.string   "banca",           :limit => 40,  :null => false
    t.string   "agenzia",         :limit => 120, :null => false
    t.string   "iban",            :limit => 27,  :null => false
    t.integer  "mod_pag_id",                     :null => false
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clienti", ["id"], :name => "PrimaryKey", :unique => true
  add_index "clienti", ["ragione_sociale"], :name => "RagioneSociale"

  create_table "destinazioni", :force => true do |t|
    t.integer  "clienti_id"
    t.integer  "destinazioni_id"
    t.string   "via",             :limit => 40, :null => false
    t.string   "citta",           :limit => 50, :null => false
    t.string   "provincia",       :limit => 2,  :null => false
    t.string   "cap",             :limit => 5,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "destinazioni", ["clienti_id", "destinazioni_id"], :name => "primarykey", :unique => true

  create_table "dettagli_bolle", :force => true do |t|
    t.integer  "bolle_id",                                         :null => false
    t.integer  "dettagli_ordini_id"
    t.integer  "prodotti_id",                                      :null => false
    t.integer  "VarianteColore"
    t.decimal  "quantita",           :precision => 8, :scale => 4, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dettagli_bolle", ["id"], :name => "PrimaryKey", :unique => true

  create_table "dettagli_fatture", :force => true do |t|
    t.integer "fatture_id",                                                       :null => false
    t.integer "prodotti_id",                                                      :null => false
    t.decimal "quantita",        :precision => 8, :scale => 4,                    :null => false
    t.decimal "prezzo_unitario", :precision => 8, :scale => 4,                    :null => false
    t.boolean "conformato",                                    :default => false, :null => false
    t.boolean "omaggio",                                       :default => false, :null => false
  end

  add_index "dettagli_fatture", ["fatture_id"], :name => "fattura"
  add_index "dettagli_fatture", ["id"], :name => "PrimaryKey", :unique => true

  create_table "dettagli_ordini", :force => true do |t|
    t.integer  "ordini_id"
    t.integer  "prodotti_id"
    t.integer  "cartella_colore",                    :null => false
    t.integer  "variante_colore",                    :null => false
    t.boolean  "evasa",           :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dettagli_ordini", ["id"], :name => "PrimaryKey", :unique => true
  add_index "dettagli_ordini", ["ordini_id"], :name => "IDOrdine"

  create_table "fatture", :force => true do |t|
    t.integer  "agenti_id"
    t.integer  "clienti_id",                                                                    :null => false
    t.integer  "provvigione"
    t.integer  "bolla_id",                                                                      :null => false
    t.integer  "numero",                                                                        :null => false
    t.integer  "anno",                                                                          :null => false
    t.datetime "data",                                                                          :null => false
    t.integer  "sconto"
    t.string   "banca",         :limit => 40,                                :default => "",    :null => false
    t.string   "agenzia",       :limit => 120,                               :default => "",    :null => false
    t.string   "iban",          :limit => 27,                                :default => "",    :null => false
    t.text     "note"
    t.boolean  "provv_pagata",                                               :default => false, :null => false
    t.decimal  "spese_incasso",                :precision => 8, :scale => 4,                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fatture", ["agenti_id"], :name => "Per Agente", :unique => true
  add_index "fatture", ["anno", "numero"], :name => "Per numero", :unique => true
  add_index "fatture", ["data"], :name => "Per data"
  add_index "fatture", ["id"], :name => "PrimaryKey", :unique => true

  create_table "fornitori", :force => true do |t|
    t.string   "ragione_sociale", :limit => 50,  :null => false
    t.string   "via",             :limit => 40,  :null => false
    t.string   "citta",           :limit => 50,  :null => false
    t.string   "provincia",       :limit => 2,   :null => false
    t.string   "cap",             :limit => 5,   :null => false
    t.integer  "zona_id",                        :null => false
    t.string   "telefono1",       :limit => 15
    t.string   "telefono2",       :limit => 15
    t.string   "telefono3",       :limit => 15
    t.string   "fax",             :limit => 30
    t.string   "codfis_piva",     :limit => 16,  :null => false
    t.string   "banca",           :limit => 40,  :null => false
    t.string   "agenzia",         :limit => 120, :null => false
    t.string   "iban",            :limit => 27,  :null => false
    t.integer  "mod_pag_id",                     :null => false
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fornitori", ["id"], :name => "PrimaryKey", :unique => true
  add_index "fornitori", ["ragione_sociale"], :name => "RagioneSociale"

  create_table "magazzino", :force => true do |t|
    t.integer  "prodotto_id",                               :null => false
    t.integer  "campagna_id",                               :null => false
    t.integer  "taglia",                                    :null => false
    t.boolean  "conformato",                                :null => false
    t.decimal  "qta_resa",    :precision => 8, :scale => 4, :null => false
    t.decimal  "qta",         :precision => 8, :scale => 4, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "magazzino", ["id"], :name => "PrimaryKey", :unique => true
  add_index "magazzino", ["prodotto_id", "campagna_id", "taglia"], :name => "IDProdottoInCampagna", :unique => true

  create_table "mod_pags", :force => true do |t|
    t.string   "descrizione",        :limit => 35,                :null => false
    t.integer  "dilazione_iniziale",                              :null => false
    t.integer  "num_rate",                         :default => 0, :null => false
    t.string   "scadenza",           :limit => 1
    t.integer  "sconto",                           :default => 0, :null => false
    t.string   "tipo_pagamento",     :limit => 1
    t.integer  "piu_sconto",                       :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mod_pags", ["descrizione"], :name => "mod_pag_descr", :unique => true
  add_index "mod_pags", ["id"], :name => "PrimaryKey", :unique => true

  create_table "modelli", :force => true do |t|
    t.string   "descrizione", :limit => 35, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "modelli", ["id"], :name => "modello", :unique => true

  create_table "ordini", :force => true do |t|
    t.integer  "numero",                         :null => false
    t.integer  "anno",                           :null => false
    t.datetime "data",                           :null => false
    t.string   "periodo_consegna", :limit => 10, :null => false
    t.integer  "cliente_id"
    t.integer  "destinazione_id"
    t.integer  "agente_id"
    t.integer  "provvigione",                    :null => false
    t.integer  "campagna_id"
    t.integer  "mod_pag_id"
    t.text     "note",                           :null => false
    t.boolean  "annullato",                      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ordini", ["anno", "numero"], :name => "NumAnnualeOrdine", :unique => true
  add_index "ordini", ["cliente_id", "destinazione_id"], :name => "Destinazione"
  add_index "ordini", ["id"], :name => "PrimaryKey", :unique => true

  create_table "prodotti", :force => true do |t|
    t.integer  "codice",                                                          :default => 0,  :null => false
    t.string   "descrizione",       :limit => 50,                                 :default => "", :null => false
    t.integer  "modello_id",                                                                      :null => false
    t.string   "composizione",      :limit => 100,                                                :null => false
    t.integer  "prezzo_unitario",   :limit => 10,  :precision => 10, :scale => 0
    t.integer  "IVA",                                                             :default => 0,  :null => false
    t.integer  "campagna_id",                                                                     :null => false
    t.decimal  "prezzo_conformato",                :precision => 8,  :scale => 2,                 :null => false
    t.integer  "unita_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prodotti", ["codice"], :name => "Codice Prodotto", :unique => true
  add_index "prodotti", ["id"], :name => "PrimaryKey", :unique => true

  create_table "subdettagli_bolle", :force => true do |t|
    t.integer  "dettagli_bolle_id",                                 :null => false
    t.integer  "subdettaglio_ord_id",                               :null => false
    t.integer  "taglia",                                            :null => false
    t.decimal  "quantita",            :precision => 8, :scale => 4, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subdettagli_bolle", ["dettagli_bolle_id"], :name => "IDDettaglioBolla"
  add_index "subdettagli_bolle", ["id"], :name => "PrimaryKey", :unique => true

  create_table "subdettagli_ordini", :force => true do |t|
    t.integer  "dettagli_ordini_id",                               :null => false
    t.integer  "taglia",                                           :null => false
    t.decimal  "quantita",           :precision => 8, :scale => 4, :null => false
    t.decimal  "qta_evasa",          :precision => 8, :scale => 4, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subdettagli_ordini", ["dettagli_ordini_id", "taglia"], :name => "Taglie in ordine"
  add_index "subdettagli_ordini", ["id"], :name => "PrimaryKey", :unique => true

  create_table "ultimi_doc", :force => true do |t|
    t.integer  "anno",                      :null => false
    t.integer  "ord_num",    :default => 0
    t.integer  "bolla_num",  :default => 0
    t.integer  "fatt_num",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ultimi_doc", ["anno"], :name => "PrimaryKey", :unique => true

  create_table "unita", :force => true do |t|
    t.string "unita", :limit => 5
  end

  add_index "unita", ["id"], :name => "PrimaryKey", :unique => true
  add_index "unita", ["unita"], :name => "Unita", :unique => true

  create_table "utenti", :force => true do |t|
    t.string  "identificativo", :limit => 15,                :null => false
    t.string  "password",       :limit => 15,                :null => false
    t.string  "descrizione",    :limit => 50
    t.integer "livello",                      :default => 0, :null => false
  end

  add_index "utenti", ["id"], :name => "IDUtente", :unique => true
  add_index "utenti", ["identificativo"], :name => "PrimaryKey", :unique => true

  create_table "vettori", :force => true do |t|
    t.string "descrizione", :limit => 50, :default => "", :null => false
    t.string "via",         :limit => 40, :default => "", :null => false
    t.string "citta",       :limit => 50, :default => "", :null => false
    t.string "provincia",   :limit => 2,  :default => "", :null => false
    t.string "cap",         :limit => 5,  :default => "", :null => false
    t.string "telefono1",   :limit => 15, :default => "", :null => false
    t.string "telefono2",   :limit => 15, :default => "", :null => false
    t.string "telefono3",   :limit => 15, :default => "", :null => false
    t.string "fax",         :limit => 30, :default => "", :null => false
  end

  add_index "vettori", ["descrizione"], :name => "Vettore", :unique => true
  add_index "vettori", ["id"], :name => "PrimaryKey", :unique => true

  create_table "zone", :force => true do |t|
    t.string "descrizione", :limit => 35, :null => false
  end

  add_index "zone", ["descrizione"], :name => "Zonadescr", :unique => true
  add_index "zone", ["id"], :name => "PrimaryKey", :unique => true

end
