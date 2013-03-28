class ModPags < ActiveRecord::Migration
  def self.up
    create_table :mod_pags do |t|
      t.string :descrizione, :limit => 35, :null => false
      t.integer :dilazione_iniziale, :null => false
      t.integer :num_rate, :default => 0, :null => false
      t.string :scadenza, :limit => 1, :null => true
      t.integer :sconto, :default => 0, :null => false
      t.string :tipo_pagamento, :limit => 1, :null => true
      t.integer :piu_sconto, :default => 0, :null => false
      t.timestamps
    end
    # Create index: "Descrizione"
    add_index(:mod_pags, :descrizione, {:name => 'mod_pag_descr', :unique => true})
    # Create index: "PrimaryKey"
    add_index(:mod_pags, :id, {:name => 'PrimaryKey', :unique => true})
  end

  def self.down
    drop_table :mod_pags
  end
end
