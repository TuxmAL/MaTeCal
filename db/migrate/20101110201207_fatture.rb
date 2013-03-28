class Fatture < ActiveRecord::Migration
  def self.up
    create_table :fatture do |t|
      t.references :agenti
      t.references :clienti, :null => false
      t.integer :provvigione
      t.references :bolla, :null => false
      t.integer :numero, :null => false
      t.integer :anno, :null => false #, :default => "Year(Date())"
      t.datetime :data, :null => false #, :default => "today()"
      t.erferences :mod_pag, :null => false
      t.integer :sconto
      t.string :banca, :limit => 40, :default => "", :null => false
      t.string :agenzia, :limit => 120, :default => "", :null => false
      t.string :iban, :limit => 27, :default => "", :null => false
      t.text :note
      t.boolean :provv_pagata, :default => false, :null => false
      t.decimal :spese_incasso, :precision => 8, :scale => 4, :null => false
      t.timestamps
    end
    # Create index: "Per Agente"
    add_index(:fatture, :agenti_id, {:name => 'Per Agente', :unique => true})
    # Create index: "Per data"
    add_index(:fatture, :data, {:name => 'Per data'})
    # Create index: "Per numero"
    add_index(:fatture, [:anno, :numero], {:name => 'Per numero', :unique => true})
    # Create index: "PrimaryKey"
    add_index(:fatture, :id, {:name => 'PrimaryKey', :unique => true})
  end

  def self.down
    drop_table :fatture
  end
end
