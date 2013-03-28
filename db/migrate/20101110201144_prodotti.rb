class Prodotti < ActiveRecord::Migration
  def self.up
    create_table :prodotti do |t|
      t.integer :codice, :default => 0, :null => false
      t.string :descrizione, :limit => 50, :default => "", :null => false
      t.references :modello, :null => false
      t.string :composizione, :limit => 100, :null => false
      t.decimal :prezzo_unitario # 8, :default => "", :null => false
      t.integer :IVA, :default => 0, :null => false
      t.references :campagna, :null => false
      t.decimal :prezzo_conformato, :precision => 8, :scale => 2, :null => false
      t.references :unita, :null => true
      t.timestamps
    end
    # Create index: "Codice Prodotto"
    add_index(:prodotti, :codice, {:name => 'Codice Prodotto', :unique => true})
    # Create index: "PrimaryKey"
    add_index(:prodotti, :id, {:name => 'PrimaryKey', :unique => true})
  end

  def self.down
    drop_table :prodotti
  end
end
