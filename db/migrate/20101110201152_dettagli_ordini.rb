class DettagliOrdini < ActiveRecord::Migration
  def self.up
    create_table :dettagli_ordini do |t|
      t.references :ordini
      t.references :prodotti
      t.integer :cartella_colore, :null => false
      t.integer :variante_colore, :null => false
      t.boolean :evasa, :default => false, :null => false
      t.timestamps
    end
    # Create index: "IDOrdine"
    add_index(:dettagli_ordini, :ordini_id, {:name => 'IDOrdine'})
    # Create index: "PrimaryKey"
    add_index(:dettagli_ordini, :id, {:name => 'PrimaryKey', :unique =>true})
  end

  def self.down
    drop_table :dettagli_ordini
  end
end
