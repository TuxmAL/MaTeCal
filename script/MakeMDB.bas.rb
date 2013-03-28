#
#http://dizzy.co.uk/ruby_on_rails/cheatsheets/rails-migrations#create_table
#
class CreateAnagrafiche < ActiveRecord::Migration
  def self.up
  # Create table: "Utente"
    create_table :utenti do |t|
      t.string :identificativo, :limit => 15, :null => false
      t.string :password, :limit => 15, :null => false
      t.string :descrizione, :limit => 50, :null => true
      t.int :livello, :default => "0", :null => false
    end
    # Create index: "IDUtente"
    add_index(:utenti, :id, {:name => 'IDUtente', :unique => true})
    # Create index: "PrimaryKey"
    add_index(:utenti, :identificativo, {:name => 'PrimaryKey', :unique => true})

  # Create table: "Campagna"
    create_table :campagne do |t|
      t.string :descrizione, :limit => 50, :null => false
      t.timestamps
    end
    # Create index: "PrimaryKey"
    add_index(:campagne, :id, {:name => 'campagna', :unique => true})

    # Create table: "Causali"
    create_table :causali do |t|
      t.string :causale, :limit => 25, :null => false
      t.timestamps
    end
    # Create index: "Causale"
    add_index(:causali, :id, {:name => 'causale', :unique => true})

    # Create table: "Modelli"
    create_table :modelli do |t|
      t.string :descrizione, :limit => 35, :null => false
      t.timestamps
    end
    # create index: "primarykey"
    add_index(:modelli, :id, {:name => 'modello', :unique => true})
    
    # Create table: "Modalita' di pagamento"
    create_table :mod_pags do |t|
      t.string :descrizione, :limit => 35, :null => false
      t.int :dilazione_iniziale, :null => false
      t.int :num_rate, :default => "0", :null => false
      t.string :scadenza, :limit => 1, :null => true
      t.int :sconto, :default => "0", :null => false
      t.string :tipo_pagamento, :limit => 1, :null => true
      t.int :piu_sconto, :default => "0", :null => false
      t.timestamps
    end
    # Create index: "Descrizione"
    add_index(:mod_pags, :descrizione, {:name => 'mod_pag_descr', :unique => true})
    # Create index: "PrimaryKey"
    add_index(:mod_pags, :id, {:name => 'PrimaryKey', :unique => true})

    # Create table: "Destinazione"
    create_table :destinazioni do |t|
      t.references :clienti
      t.references :destinazioni
      t.string :via, :limit => 40, :null => false
      t.string :citta, :limit => 50, :null => false
      t.string :provincia, :limit => 2, :null => false
      t.string :cap, :limit => 5, :null => false
      t.timestamps
    end
    # Create index: "PrimaryKey"
    add_index(:destinazioni, [:cliente_id, :destinazione_id], {:name => 'primarykey', :unique => true})

    # Create table: "Unita"
    create_table :unita do |t|
      t.string :unita, :limit => 5, :null => true
    end
    # Create index: "PrimaryKey"
    add_index(:unita, :id, {:name => 'PrimaryKey', :unique => true})
    # Create index: "Unita"
    add_index(:unita, :unita, {:name => 'Unita', :unique => true})

    # Create table: "Zone"
    create_table :zone do |t|
      t.string :descrizione, :limit => 35, :null => false
    end
    # Create index: "PrimaryKey"
    add_index(:zone, :id, {:name => 'PrimaryKey', :unique => true})
    # Create index: "Zonadescr"
    add_index(:zone, :descrizione, {:name => 'Zonadescr', :unique => true})
    
    # Create table: "UltimiDoc"
    create_table(:ultimi_doc, :primarykey => :anno) do |t|
      t.int :anno, :default => "Year(Now())", :null => true
      t.int :ord_num, :default => "0", :null => true
      t.int :bolla_num, :default => "0", :null => true
      t.int :fatt_num, :default => "0", :null => true
      t.timestamps
    end
    # Create index: "PrimaryKey"
    add_index(:ultimo_doc, :anno, {:name => 'PrimaryKey', :unique => true})

      # Create table: "Agenti"
    create_table :agenti do |t|
      t.string :cognome, :limit => 30, :null => false
      t.string :nome, :limit => 25, :null => false
      t.string :via, :limit => 40, :null => false
      t.string :citta, :limit => 50, :null => false
      t.string :provincia, :limit => 2, :null => false
      t.string :cap, :limit => 5, :null => false
      t.references :zona, :null => false
      t.string :telefono1, :limit => 15, :null => true
      t.string :telefono2, :limit => 15, :null => true
      t.string :telefono3, :limit => 15, :null => true
      t.string :fax, :limit => 30, :null => true
      t.string :codfis_piva, :limit => 15, :null => false
      t.int :provvigione, :default => "0", :null => false
      t.timestamps
    end
    # Create index: "cognome_nome"
    add_index(:agenti, [:cognome, :nome], {:name => 'cognome_nome'})
    # Create index: "primarykey"
    add_index(:agenti, :id, {:name => 'primarykey', :unique => true})

    # Create table: "Clienti"
    create_table :clienti do |t|
      t.string :ragione_sociale, :limit => 50, :null => false
      t.string :via, :limit => 40, :null => false
      t.string :citta, :limit => 50, :null => false
      t.string :provincia, :limit => 2, :null => false
      t.string :cap, :limit => 5, :null => false
      t.references :zona, :null => false
      t.string :telefono1, :limit => 15, :null => true
      t.string :telefono2, :limit => 15, :null => true
      t.string :telefono3, :limit => 15, :null => true
      t.string :fax, :limit => 30, :null => true
      t.string :codfis_piva, :limit => 16, :null => false
      t.string :banca, :limit => 40, :null => false
      t.string :agenzia, :limit => 120, :null => false
      t.string :iban, :limit => 27, :null => false
      t.references :mod_pag, :null => false
      t.text :note, :null => true
      t.timestamps
    end
    # Create index: "PrimaryKey"
    add_index(:clienti, :id, {:name => 'PrimaryKey', :unique =>true})
    # Create index: "RagioneSociale"
    add_index(:clienti, :ragione_sociale, {:name => 'RagioneSociale'})
    
    # Create table: "Fornitori"
    create_table :fornitori do |t|
      t.string :ragione_sociale, :limit => 50, :null => false
      t.string :via, :limit => 40, :null => false
      t.string :citta, :limit => 50, :null => false
      t.string :provincia, :limit => 2, :null => false
      t.string :cap, :limit => 5, :null => false
      t.references :zona, :null => false
      t.string :telefono1, :limit => 15, :null => true
      t.string :telefono2, :limit => 15, :null => true
      t.string :telefono3, :limit => 15, :null => true
      t.string :fax, :limit => 30, :null => true
      t.string :codfis_piva, :limit => 16, :null => false
      t.string :banca, :limit => 40, :null => false
      t.string :agenzia, :limit => 120, :null => false
      t.string :iban, :limit => 27, :null => false
      t.references :mod_pag, :null => false
      t.text :note, :null => true
      t.timestamps
    end
    # Create index: "PrimaryKey"
    add_index(:fornitori, :id, {:name => 'PrimaryKey', :unique =>true})
    # Create index: "RagioneSociale"
    add_index(:fornitori, :ragione_sociale, {:name => 'RagioneSociale'})

    # Create table: "Vettori"
    create_table :vettori do |t|
      t.string :descrizione, :limit => 50, :default => "", :null => false
      t.string :via, :limit => 40, :default => "", :null => false
      t.string :citta, :limit => 50, :default => "", :null => false
      t.string :provincia, :limit => 2, :default => "", :null => false
      t.string :cap, :limit => 5, :default => "", :null => false
      t.string :telefono1, :limit => 15, :default => "", :null => false
      t.string :telefono2, :limit => 15, :default => "", :null => false
      t.string :telefono3, :limit => 15, :default => "", :null => false
      t.string :fax, :limit => 30, :default => "", :null => false
    end
    # Create index: "PrimaryKey"
    add_index(:vettori, :id, {:name => 'PrimaryKey', :unique => true})
    # Create index: "Vettore"
    add_index(table_name, :descrizione, {:name => 'Vettore', :unique => true})

    # Create table: "Prodotti"
    create_table :prodotti do |t|
      t.int :codice, :default => "0", :null => false
      t.string :descrizione, :limit => 50, :default => "", :null => false
      t.references :modello, :null => false
      t.string :composizione, :limit => 100, :null => false
      t.decimal :prezzo_unitario # 8, :default => "", :null => false
      t.int :IVA, :default => "", :null => false
      t.references :campagna, :null => false
      t.decimal :prezzo_conformato, :precision => 8, :scale => 2, :null => false
      t.references :unita, :null => true
      t.timestamps
    end
    # Create index: "Codice Prodotto"
    add_index(:prodotti, :codice, {:name => 'Codice Prodotto', :unique => true})
    # Create index: "PrimaryKey"
    add_index(:prodotti, :id, {:name => 'PrimaryKey', :unique => true})

    # Create table: "Magazzino"
    create_table :magazzino do |t|
      t.references :prodotto, :null => false
      t.references :campagna, :null => false
      t.int :taglia, :null => false
      t.boolean :conformato, :null => false
      t.decimal :qta_resa, :precision => 8, :scale => 4, :null => false
      t.decimal :qta, :precision => 8, :scale => 4, :null => false
      t.timestamps
    end
    # Create index: "IDProdottoInCampagna"
    add_index(table_name, [:prodotto_id, :campagna_id, :taglia], {:name => 'IDProdottoInCampagna', :unique => true})
    # Create index: "PrimaryKey"
    add_index(table_name, :id, {:name => 'PrimaryKey', :unique => true})

      # Create table: "Ordini"
    create_table :ordini do |t|
      t.int :numero, :null => false
      t.int :anno :default => "Year(Date())", :null => false
      t.datetime :data, :default => "Date()", :null => false
      t.string :periodo_consegna, :limit => 10, :null => false
      t.references :cliente
      t.references :destinazione
      t.references :agente
      t.int :provvigione, :null => false
      t.references :campagna
      t.references :mod_pag
      t.text :note, :default => "", :null => false
      t.boolean :annullato, :null => false
      t.timestamps
    end
    # Create index: "Destinazione"
    add_index(:ordini, [:cliente_id, :destinazione_id], {:name => 'Destinazione'})
    # Create index: "NumAnnualeOrdine"
    add_index(:ordini, [:anno, :numero], {:name => 'NumAnnualeOrdine', :unique => true})
    # Create index: "PrimaryKey"
    add_index(:ordini, :id, {:name => 'PrimaryKey', :unique => true})

    # Create table: "Dettagli ordini"
    create_table :dettagli_ordini do |t|
      t.references :ordini
      t.references :prodotti
      t.int :cartella_colore, :null => false
      t.int :variante_colore, :null => false
      t.boolean :evasa, :default => false, :null => false
      t.timestamps
    end
    # Create index: "IDOrdine"
    add_index(:dettagli_ordini, :ordine_id, {:name => 'IDOrdine'})
    # Create index: "PrimaryKey"
    add_index(:dettagli_ordini, [:column, :coumn], {:name => 'PrimaryKey', :unique =>true})

    # Create table: "Subdettagli ordini"
    create_table :subdettagli_ordini do |t|
      t.references :dettagli_ordini, :null => false
      t.int :taglia, :null => false
      t.decimal :quantita, :precision => 8, :scale => 4, :null => false
      t.decimal :qta_evasa, :precision => 8, :scale => 4, :null => false
      t.timestamps
    end
    # Create index: "PrimaryKey"
    add_index(:subdettagli_ordini, :id, {:name => 'PrimaryKey', :unique => true})
    # Create index: "Taglie nell'ordine"
    add_index(:subdettagli_ordini, [:dettaglio_ordine_id, :taglia], {:name => 'Taglie in ordine'})

    # Create table: "Bolle"
    create_table :bolle do |t|
      t.int :numero, :null => false
      t.int :anno, :default => "year(date())", :null => false
      t.datetime :data, :default => "today()", :null => false
      t.int :provvigione
      t.references :agenti
      t.references :clienti, :null => false
      t.references :destinazioni, :null => true
      t.references :vettori, :null => true
      t.references :mod_pag, :null => false
      t.references :causali, :null => false 
      t.int :trasporto, :default => "0", :null => false
      t.int :colli, :default => "0", :null => false
      t.int :aspetto, :default => "0", :null => false
      t.text :note, :null => true
      t.timestamps
    end
  # Create index: "BolleIDVettore"
    add_index(:bolle, :vettore_id, {:name => 'BolleIDVettore'})
    # Create index: "Destinazione"
    add_index(:bolle, [:cliente_id, :destinazione_id], {:name => 'Destinazione', :unique => true})
    # Create index: "Per data"
    add_index(:bolle, :data, {:name => 'Per data'})
    # Create index: "Per numero"
    add_index(:bolle, [:anno, :numero], {:name => 'Per numero', :unique => true})
    # Create index: "PrimaryKey"
    add_index(:bolle, :id, {:name => 'PrimaryKey', :unique => true})

    # Create table: "Dettagli bolle"
    create_table :dettagli_bolle do |t|
      t.references :bolle, :null => false
      t.references :dettagli_ordini
      t.references :prodotti, :null => false
      t.int :VarianteColore
      t.decimal :quantita, :precision => 8, :scale => 4, :null => false
      t.timestamps
    end
    # Create index: "PrimaryKey"
    add_index(:dettagli_bolle, :dettaglio_bolla_id, {:name => 'PrimaryKey', :unique => true})

    # Create table: "Subdettagli bolle"
    create_table :subdettagli_bolle do |t|
      t.references :dettagli_bolla, :null => false
      t.references :subdettaglio_ord, :null => false
      t.int :taglia, :null => false
      t.decimal :quantita, :precision => 8, :scale => 4, :null => false
      t.timestamps
    end
    # Create index: "IDDettaglioBolla"
    add_index(:subdettagli_bolle, :dettaglio_bolla_id, {:name => 'IDDettaglioBolla', :unique => false})
    # Create index: "PrimaryKey"
    add_index(:subdettagli_bolle, :subdettaglio_bolle_id, {:name => 'PrimaryKey', :unique => true})

    # Create table: "Fatture"
    create_table :fatture do |t|
      t.references :agenti
      t.references :clienti, :null => false
      t.int :provvigione
      t.references :bolla, :null => false
      t.int :numero, :null => false
      t.int :anno, :default => "Year(Date())", :null => false
      t.datetime :data, :default => "today()", :null => false
      t.erferences :mod_pag, :null => false
      t.int :sconto
      t.string :banca, :limit => 40, :default => "", :null => false
      t.string :agenzia, :limit => 120, :default => "", :null => false
      t.string :iban, :limit => 27, :default => "", :null => false
      t.text :note
      t.boolean :provv_pagata, :default => false, :null => false
      t.decimal :spese_incasso, :precision => 8, :scale => 4, :null => false
      t.timestamps
    end
    # Create index: "Per Agente"
    add_index(:fatture, :agente_id, {:name => 'Per Agente', :unique => true})
    # Create index: "Per data"
    add_index(:fatture, :data, {:name => 'Per data'})
    # Create index: "Per numero"
    add_index(:fatture, [:anno, :numero], {:name => 'Per numero', :unique => true})
    # Create index: "PrimaryKey"
    add_index(:fatture, :fattura_id, {:name => 'PrimaryKey', :unique => true})

    # Create table: "Dettagli fatture"
    create_table :dettagli_fatture do |t|
      t.erferences :fatture, :null => false
      t.references :prodotti, :null => false
      t.decimal :quantita, :precision => 8, :scale => 4, :null => false
      t.decimal :prezzo_unitario, :precision => 8, :scale => 4, :null => false
      t.boolean :conformato, :default => false, :null => false
      t.boolean :omaggio, :default => false, :null => false
    end
    # Create index: "Fattura"
    add_index(:dettagli_fatture, :fattura_id, {:name => 'fattura'})
    # Create index: "PrimaryKey"
    add_index(:dettagli_fatture, :dettaglio_fattura_id, {:name => 'PrimaryKey', :unique => true})

  end

  def self.down
    drop_table :utenti
    drop_table :campagne
    drop_table :causali
    drop_table :modelli
    drop_table :mod_pags
    drop_table :destinazioni
    drop_table :unita
    drop_table :zone
    drop_table :ultimi_doc
    drop_table :agenti
    drop_table :clienti
    drop_table :fornitori
    drop_table :vettori
    drop_table :prodotti
    drop_table :magazzino
    drop_table :ordini
    drop_table :dettagli_ordini
    drop_table :subdettagli_ordini
    drop_table :bolle
    drop_table :dettagli_bolle
    drop_table :subdettagli_bolle
    drop_table :fatture
    drop_table :dettagli_fatture
    end
end

#########################################################################
Public Function MakeNewDatabase(DatabaseName As String) As Boolean

  Dim dbNew As Database
  Dim fldNew As Field
  Dim relNew As Relation
  Dim sqSQL As String
  
  
#ALTER TABLE `accounts`
#  ADD CONSTRAINT `FK_myKey` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;
    

  # Create relationship: "AgentiBolle"
  Set relNew = dbNew.CreateRelation("AgentiBolle", "Agenti", "Bolle",0)
    Set fldNew = relNew.CreateField("IDAgente")
    fldNew.ForeignName = "IDAgente"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "AgentiOrdini"
  Set relNew = dbNew.CreateRelation("AgentiOrdini", "Agenti", "Ordini",33554688)
    Set fldNew = relNew.CreateField("IDAgente")
    fldNew.ForeignName = "IDAgente"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "BolleDestinazione"
  Set relNew = dbNew.CreateRelation("BolleDestinazione", "Bolle", "Destinazione",16777218)
    Set fldNew = relNew.CreateField("IDCliente")
    fldNew.ForeignName = "IDCliente"
    relNew.Fields.Append fldNew
    Set fldNew = relNew.CreateField("IDDestinazione")
    fldNew.ForeignName = "IDDestinazione"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "BolleDettagli bolla"
  Set relNew = dbNew.CreateRelation("BolleDettagli bolla", "Bolle", "Dettagli bolle",4352)
    Set fldNew = relNew.CreateField("IDBolla")
    fldNew.ForeignName = "IDBolla"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "CampagnaMagazzino"
  Set relNew = dbNew.CreateRelation("CampagnaMagazzino", "Campagna", "Magazzino",4352)
    Set fldNew = relNew.CreateField("IDCampagna")
    fldNew.ForeignName = "IDCampagna"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "CampagnaOrdini"
  Set relNew = dbNew.CreateRelation("CampagnaOrdini", "Campagna", "Ordini",256)
    Set fldNew = relNew.CreateField("IDCampagna")
    fldNew.ForeignName = "IDCampagna"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "CampagnaProdotti"
  Set relNew = dbNew.CreateRelation("CampagnaProdotti", "Campagna", "Prodotti",4352)
    Set fldNew = relNew.CreateField("IDCampagna")
    fldNew.ForeignName = "IDCampagna"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "CausaliBolle"
  Set relNew = dbNew.CreateRelation("CausaliBolle", "Causali", "Bolle",33554688)
    Set fldNew = relNew.CreateField("IDCausale")
    fldNew.ForeignName = "IDCausale"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "ClientiBolle"
  Set relNew = dbNew.CreateRelation("ClientiBolle", "Clienti", "Bolle",256)
    Set fldNew = relNew.CreateField("IDCliente")
    fldNew.ForeignName = "IDCliente"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "ClientiDestinazione"
  Set relNew = dbNew.CreateRelation("ClientiDestinazione", "Clienti", "Destinazione",2)
    Set fldNew = relNew.CreateField("IDCliente")
    fldNew.ForeignName = "IDCliente"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "ClientiFatture"
  Set relNew = dbNew.CreateRelation("ClientiFatture", "Clienti", "Fatture",256)
    Set fldNew = relNew.CreateField("IDCliente")
    fldNew.ForeignName = "IDCliente"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "ClientiOrdini"
  Set relNew = dbNew.CreateRelation("ClientiOrdini", "Clienti", "Ordini",4352)
    Set fldNew = relNew.CreateField("IDCliente")
    fldNew.ForeignName = "IDCliente"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "Dettagli bolleSubdettagli bolle"
  Set relNew = dbNew.CreateRelation("Dettagli bolleSubdettagli bolle", "Dettagli bolle", "Subdettagli bolle",4096)
    Set fldNew = relNew.CreateField("IDDettaglioBolla")
    fldNew.ForeignName = "IDDettaglioBolla"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "Dettagli ordiniSubdettagli ordini"
  Set relNew = dbNew.CreateRelation("Dettagli ordiniSubdettagli ordini", "Dettagli ordini", "Subdettagli ordini",4352)
    Set fldNew = relNew.CreateField("IDDettaglioOrdine")
    fldNew.ForeignName = "IDDettaglioOrdine"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "FattureDettagli fatture"
  Set relNew = dbNew.CreateRelation("FattureDettagli fatture", "Fatture", "Dettagli fatture",4352)
    Set fldNew = relNew.CreateField("IDFattura")
    fldNew.ForeignName = "IDFattura"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "Modalita di pagamentoClienti"
  Set relNew = dbNew.CreateRelation("Modalita di pagamentoClienti", "Modalita di pagamento", "Clienti",256)
    Set fldNew = relNew.CreateField("IDModalitaPagamento")
    fldNew.ForeignName = "IDModalitaPagamento"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "Modalita di pagamentoOrdini"
  Set relNew = dbNew.CreateRelation("Modalita di pagamentoOrdini", "Modalita di pagamento", "Ordini",256)
    Set fldNew = relNew.CreateField("IDModalitaPagamento")
    fldNew.ForeignName = "IDModalitaPagamento"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "ModelliProdotti"
  Set relNew = dbNew.CreateRelation("ModelliProdotti", "Modelli", "Prodotti",0)
    Set fldNew = relNew.CreateField("IDModello")
    fldNew.ForeignName = "IDModello"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "OrdiniBolle"
  Set relNew = dbNew.CreateRelation("OrdiniBolle", "Ordini", "Bolle",2)
    Set fldNew = relNew.CreateField("IDOrdine")
    fldNew.ForeignName = "IDOrdine"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "OrdiniDestinazione"
  Set relNew = dbNew.CreateRelation("OrdiniDestinazione", "Ordini", "Destinazione",16777218)
    Set fldNew = relNew.CreateField("IDCliente")
    fldNew.ForeignName = "IDCliente"
    relNew.Fields.Append fldNew
    Set fldNew = relNew.CreateField("IDDestinazione")
    fldNew.ForeignName = "IDDestinazione"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "OrdiniDettagli ordini"
  Set relNew = dbNew.CreateRelation("OrdiniDettagli ordini", "Ordini", "Dettagli ordini",4352)
    Set fldNew = relNew.CreateField("IDOrdine")
    fldNew.ForeignName = "IDOrdine"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "ProdottiDettagli bolla"
  Set relNew = dbNew.CreateRelation("ProdottiDettagli bolla", "Prodotti", "Dettagli bolle",256)
    Set fldNew = relNew.CreateField("IDProdotto")
    fldNew.ForeignName = "IDProdotto"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "ProdottiDettagli fatture"
  Set relNew = dbNew.CreateRelation("ProdottiDettagli fatture", "Prodotti", "Dettagli fatture",256)
    Set fldNew = relNew.CreateField("IDProdotto")
    fldNew.ForeignName = "IDProdotto"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "ProdottiDettagli ordini"
  Set relNew = dbNew.CreateRelation("ProdottiDettagli ordini", "Prodotti", "Dettagli ordini",256)
    Set fldNew = relNew.CreateField("IDProdotto")
    fldNew.ForeignName = "IDProdotto"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "ProdottiMagazzino"
  Set relNew = dbNew.CreateRelation("ProdottiMagazzino", "Prodotti", "Magazzino",256)
    Set fldNew = relNew.CreateField("IDProdotto")
    fldNew.ForeignName = "IDProdotto"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "UnitaProdotti"
  Set relNew = dbNew.CreateRelation("UnitaProdotti", "Unita", "Prodotti",33554688)
    Set fldNew = relNew.CreateField("IDUnita")
    fldNew.ForeignName = "IDUnita"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "VettoriBolle"
  Set relNew = dbNew.CreateRelation("VettoriBolle", "Vettori", "Bolle",2)
    Set fldNew = relNew.CreateField("IDVettore")
    fldNew.ForeignName = "IDVettore"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "ZoneAgenti"
  Set relNew = dbNew.CreateRelation("ZoneAgenti", "Zone", "Agenti",0)
    Set fldNew = relNew.CreateField("IDZona")
    fldNew.ForeignName = "IDZona"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation

  # Create relationship: "ZoneClienti"
  Set relNew = dbNew.CreateRelation("ZoneClienti", "Zone", "Clienti",0)
    Set fldNew = relNew.CreateField("IDZona")
    fldNew.ForeignName = "IDZona"
    relNew.Fields.Append fldNew
  dbNew.Relations.Append relNew
  dbNew.CreateRelation


# Create query: "Agente da ID"
  sqSQL = "CREATE OR REPLACE VIEW "Agente da ID" AS PARAMETERS IDAge Long;  SELECT Agenti.*  FROM Agenti  WHERE Agenti.IDAgente=IDAge;  " 

# Create query: "Annate Bolle"
  sqSQL = "CREATE OR REPLACE VIEW "Annate Bolle" AS SELECT DISTINCT [AnnoBolla]  FROM Bolle  ORDER BY AnnoBolla DESC;  " 

# Create query: "Annate Fatture"
  sqSQL = "CREATE OR REPLACE VIEW "Annate Fatture" AS SELECT DISTINCT [AnnoFatt]  FROM Fatture  ORDER BY AnnoFatt DESC;  "

# Create query: "Annate Ordini"
  sqSQL = "  CREATE OR REPLACE VIEW "Annate Ordini" AS SELECT DISTINCT [AnnoOrdine]  FROM Ordini  ORDER BY AnnoOrdine DESC; "

# Create query: "Bolla da ID"
  sqSQL = "CREATE OR REPLACE VIEW "Bolla da ID" AS PARAMETERS IDBol Long;  SELECT Bolle.*  FROM Bolle  WHERE Bolle.IDBolla=IDBol;  "

# Create query: "Campagna da ID"
  sqSQL = "CREATE OR REPLACE VIEW "Campagna da ID" AS PARAMETERS IDCam Long;  SELECT Campagna.Descrizione  FROM Campagna  WHERE IDCampagna=[IDCam];  "

# Create query: "Cliente da ID"
  sqSQL = "CREATE OR REPLACE VIEW "Cliente da ID" AS PARAMETERS IDCli Long;  SELECT *  FROM Clienti  WHERE Clienti.IDCliente=IDCli;  "

# Create query: "Cliente da Ordine Num-Anno"
  sqSQL = "CREATE OR REPLACE VIEW "Cliente da Ordine Num-Anno" AS PARAMETERS NumOrd Long, AnnoOrd Long;  SELECT Clienti.*  FROM Clienti INNER JOIN" & _
          " Ordini ON Clienti.IDCliente = Ordini.IDCliente  WHERE (((Ordini.NumeroOrdine)=[" & _
          "NumOrd]) AND ((Ordini.AnnoOrdine)=[AnnoOrd]));  "

# Create query: "Clienti inutili"
  sqSQL = "CREATE OR REPLACE VIEW "Clienti inutili" AS SELECT [Clienti senza Bolle].IDCliente  FROM ([Clienti senza Bolle] INNER JOIN [" & _
          "Clienti senza Fatture] ON [Clienti senza Bolle].IDCliente = [Clienti senza Fattu" & _
          "re].IDCliente) INNER JOIN [Clienti senza Ordini] ON ([Clienti senza Ordini].IDCl" & _
          "iente = [Clienti senza Fatture].IDCliente) AND ([Clienti senza Bolle].IDCliente " & _
          "= [Clienti senza Ordini].IDCliente);  "

# Create query: "Clienti senza Bolle"
  sqSQL = "CREATE OR REPLACE VIEW "Clienti senza Bolle" AS SELECT DISTINCTROW Clienti.IDCliente  FROM Clienti LEFT JOIN Bolle ON Clienti.ID" & _
          "Cliente = Bolle.IDCliente  WHERE (((Bolle.IDCliente) Is Null));  "

# Create query: "Clienti senza Fatture"
  sqSQL = "CREATE OR REPLACE VIEW "Clienti senza Fatture" AS SELECT DISTINCTROW Clienti.IDCliente  FROM Clienti LEFT JOIN Fatture ON Clienti." & _
          "IDCliente = Fatture.IDCliente  WHERE (((Fatture.IDCliente) Is Null));  "

# Create query: "Clienti senza Ordini"
  sqSQL = "CREATE OR REPLACE VIEW "Clienti senza Ordini" AS SELECT DISTINCTROW Clienti.IDCliente  FROM Clienti LEFT JOIN Ordini ON Clienti.I" & _
          "DCliente = Ordini.IDCliente  WHERE (((Ordini.IDCliente) Is Null));  "

# Create query: "Dest da IDCliente"
  sqSQL = "CREATE OR REPLACE VIEW "Dest da IDCliente" AS PARAMETERS IDCli Long;  SELECT *  FROM Destinazione  WHERE IDCliente =[IDCli]  O" & _
          "RDER BY [citta], [via];  "

# Create query: "Destinazione da IDCliente"
  sqSQL = "CREATE OR REPLACE VIEW "Destinazione da IDCliente" AS PARAMETERS IDCli Long;  SELECT [IDDestinazione], [Citta] + #( - #( + [Via]  FROM D" & _
          "estinazione  WHERE IDCliente =[IDCli]  ORDER BY [citta], [via];  "

# Create query: "Destinazione da IDs"
  sqSQL = "CREATE OR REPLACE VIEW "Destinazione da IDs" AS PARAMETERS IDCli Long, IDDest Long;  SELECT *  FROM Destinazione  WHERE IDClient" & _
          "e =[IDCli] and IDDestinazione = [IDDest]  ORDER BY [citta], [via];  "

# Create query: "Dettaglio da IDBolla"
  sqSQL = "CREATE OR REPLACE VIEW "Dettaglio da IDBolla" AS PARAMETERS IDBol Long;  SELECT [Dettagli bolle].*  FROM [Dettagli bolle]  WHERE " & _
          "[Dettagli bolle].IDBolla = [IDBol]  ORDER BY [Dettagli bolle].IDDettaglioBolla; "

# Create query: "Dettaglio da IDDettaglio"
  sqSQL = "CREATE OR REPLACE VIEW "Dettaglio da IDDettaglio" AS PARAMETERS IDDettOrd Long;  SELECT [Dettagli ordini].*  FROM [Dettagli ordini]  " & _
          "WHERE [Dettagli ordini].IDDettaglioOrdine = [IDDettOrd];  "

# Create query: "Dettaglio da IDFattura"
  sqSQL = "CREATE OR REPLACE VIEW "Dettaglio da IDFattura" AS PARAMETERS IDFat Long;  SELECT [Dettagli fatture].*  FROM [Dettagli fatture]  WH" & _
          "ERE [Dettagli fatture].IDFattura = [IDFat];  "

# Create query: "Dettaglio da IDOrdine"
  sqSQL = "CREATE OR REPLACE VIEW "Dettaglio da IDOrdine" AS PARAMETERS IDOrd Long;  SELECT [Dettagli ordini].*  FROM [Dettagli ordini]  WHER" & _
          "E [Dettagli ordini].IDOrdine = [IDOrd]  ORDER BY [Dettagli ordini].IDDettaglioOr" & _
          "dine;  "

# Create query: "DettBolle da IDDettaglio"
  sqSQL = "CREATE OR REPLACE VIEW "DettBolle da IDDettaglio" AS PARAMETERS IDDettBol Long;  SELECT [Dettagli bolle].*  FROM [Dettagli bolle]  WH" & _
          "ERE [Dettagli bolle].IDDettaglioBolla=[IDDettBol];  "

# Create query: "DettFatt da IDDettaglio"
  sqSQL = "CREATE OR REPLACE VIEW "DettFatt da IDDettaglio" AS PARAMETERS IDDettFatt Long;  SELECT [Dettagli fatture].*  FROM [Dettagli fatture" & _
          "]  WHERE ((([Dettagli fatture].IDDettaglioFattura)=[IDDettFatt]));  "

# Create query: "Fattura da ID"
  sqSQL = "CREATE OR REPLACE VIEW "Fattura da ID" AS PARAMETERS IDFat Long;  SELECT Fatture.*  FROM Fatture  WHERE Fatture.IDFattura=" & _
          "IDFat;  "

# Create query: "Modalita da ID"
  sqSQL = "CREATE OR REPLACE VIEW "Modalita da ID" AS PARAMETERS IDMod Long;  SELECT [mod_pag].*  FROM [Modalita di paga" & _
          "mento]  WHERE [mod_pag].IDModalitaPagamento=IDMod;  "

# Create query: "Modello da ID"
  sqSQL = "CREATE OR REPLACE VIEW "Modello da ID" AS PARAMETERS IDMod Long;  SELECT Modelli.Descrizione  FROM Modelli  WHERE IDModell" & _
          "o=[IDMod];  "

# Create query: "Ordine da ID"
  sqSQL = "CREATE OR REPLACE VIEW "Ordine da ID" AS PARAMETERS IDOrd Long;  SELECT Ordini.*  FROM Ordini  WHERE Ordini.IDOrdine=IDOr" & _
          "d;  "  

# Create query: "Prodotto da ID"
  sqSQL = "CREATE OR REPLACE VIEW "Prodotto da ID" AS PARAMETERS IDPro Long;  SELECT Prodotti.*  FROM Prodotti  WHERE Prodotti.IDProdo" & _
          "tto=IDPro;  "

# Create query: "Provvigioni Agenti"
  sqSQL = "CREATE OR REPLACE VIEW "Provvigioni Agenti" AS SELECT Fatture.IDAgente, Fatture.Provvigione, Fatture.Sconto, Sum([PrezzoUnitari" & _
          "o]*[quantita]) AS Fatturato, ([Fatturato]-[Fatturato]/100*[sconto]) AS Imponibil" & _
          "e, Imponibile/100*[provvigione] AS Dare  FROM Fatture INNER JOIN [Dettagli fattu" & _
          "re] ON Fatture.IDFattura = [Dettagli fatture].IDFattura  WHERE ((Fatture.ProvvPa" & _
          "gata)<>Yes)  GROUP BY Fatture.IDAgente, Fatture.Provvigione, Fatture.Sconto, Fat" & _
          "ture.ProvvPagata;  "

# Create query: "Provvigioni da IDAgente"
  sqSQL = "CREATE OR REPLACE VIEW "Provvigioni da IDAgente" AS PARAMETERS IDAge Long;  SELECT Fatture.IDFattura, Fatture.ProvvPagata, Fatture.N" & _
          "umeroFatt, Fatture.AnnoFatt, Fatture.DataFattura, Clienti.[Ragione Sociale], Fat" & _
          "ture.Provvigione, Fatture.Sconto, Sum([PrezzoUnitario]*[quantita]) AS Fatturato," & _
          " ([Fatturato]-[Fatturato]/100*[sconto]) AS Imponibile, Imponibile/100*[provvigio" & _
          "ne] AS Dare  FROM (Clienti RIGHT JOIN Fatture ON Clienti.IDCliente = Fatture.IDC" & _
          "liente) INNER JOIN [Dettagli fatture] ON Fatture.IDFattura = [Dettagli fatture]." & _
          "IDFattura  WHERE (((Fatture.IDAgente)=[IDAge]) AND ((Fatture.ProvvPagata)<>Yes))" & _
          "  GROUP BY Fatture.IDFattura, Fatture.ProvvPagata, Fatture.NumeroFatt, Fatture.A" & _
          "nnoFatt, Fatture.DataFattura, Clienti.[Ragione Sociale], Fatture.Provvigione, Fa" & _
          "tture.Sconto, Fatture.ProvvPagata  ORDER BY Fatture.AnnoFatt, Fatture.NumeroFatt" & _
          ";  "

# Create query: "ProvvPagata da IDAgente"
  sqSQL = "CREATE OR REPLACE VIEW "ProvvPagata da IDAgente" AS PARAMETERS IDAge Long;  SELECT Fatture.IDFattura, Fatture.ProvvPagata  FROM Fatt" & _
          "ure  WHERE (((Fatture.ProvvPagata)<>Yes) AND ((Fatture.IDAgente)=[IDAge]));  "

# Create query: "SubDettBolla da IDDettaglio"
  sqSQL = "CREATE OR REPLACE VIEW "SubDettBolla da IDDettaglio" AS PARAMETERS IDDettBolla Long;  SELECT [Subdettagli bolle].*  FROM [Subdettagli bo" & _
          "lle]  WHERE [Subdettagli bolle].IDDettaglioBolla = [IDDettBolla]  ORDER BY [Subd" & _
          "ettagli bolle].taglia;  "

# Create query: "SubDettBolla da IDSubDettaglio"
  sqSQL = "CREATE OR REPLACE VIEW "SubDettBolla da IDSubDettaglio" AS PARAMETERS IDSubDett Long;  SELECT [Subdettagli bolle].*  FROM [Subdettagli boll" & _
          "e]  WHERE [Subdettagli bolle].IDSubDettaglio = [IDSubDett];  "

# Create query: "SubDettOrd da IDDettaglio"
  sqSQL = "CREATE OR REPLACE VIEW "SubDettOrd da IDDettaglio" AS PARAMETERS IDDettOrd Long;  SELECT [Subdettagli ordini].*  FROM [Subdettagli ord" & _
          "ini]  WHERE [Subdettagli ordini].IDDettaglioOrdine = [IDDettOrd]  ORDER BY [Subd" & _
          "ettagli ordini].taglia;  "

# Create query: "SubDettOrd da IDSubDettaglio"
  sqSQL = "CREATE OR REPLACE VIEW "SubDettOrd da IDSubDettaglio" AS PARAMETERS IDSubDett Long;  SELECT [Subdettagli ordini].*  FROM [Subdettagli ord" & _
          "ini]  WHERE [Subdettagli ordini].IDSubDettaglio = [IDSubDett];  "

# Create query: "Ultima Bolla"
  sqSQL = "CREATE OR REPLACE VIEW "Ultima Bolla" AS PARAMETERS nAnno Long;  SELECT UltimoDoc.bolla_num  FROM UltimoDoc  WHERE [Anno]=nAnno;  "

# Create query: "Ultima Fattura"
  sqSQL = "CREATE OR REPLACE VIEW "Ultima Fattura" AS PARAMETERS nAnno Long;  SELECT UltimoDoc.fatt_num  FROM UltimoDoc  WHERE [Anno]=nAnno;  "

# Create query: "Ultimo Ordine"
  sqSQL = "CREATE OR REPLACE VIEW "Ultimo Ordine" AS PARAMETERS nAnno Long;  SELECT UltimoDoc.ord_num  FROM UltimoDoc  WHERE [Anno]=nAnno;  "

# Create query: "Unita da ID"
  sqSQL = "CREATE OR REPLACE VIEW "Unita da ID" AS PARAMETERS IDUMis Long;  SELECT Unita.Unita  FROM Unita  WHERE IDUnita=[IDUMis];"

# Create query: "Vettore da ID"
  sqSQL = "CREATE OR REPLACE VIEW "Vettore da ID" AS PARAMETERS IDVett Long;  SELECT Vettori.*  FROM Vettori  WHERE Vettori.IDVettore=IDVett;  "

  dbNew.close
End Function
