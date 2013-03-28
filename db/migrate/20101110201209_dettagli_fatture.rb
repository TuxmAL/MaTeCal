class DettagliFatture < ActiveRecord::Migration
  def self.up
    create_table :dettagli_fatture do |t|
      t.references :fatture, :null => false
      t.references :prodotti, :null => false
      t.decimal :quantita, :precision => 8, :scale => 4, :null => false
      t.decimal :prezzo_unitario, :precision => 8, :scale => 4, :null => false
      t.boolean :conformato, :default => false, :null => false
      t.boolean :omaggio, :default => false, :null => false
    end
    # Create index: "Fattura"
    add_index(:dettagli_fatture, :fatture_id, {:name => 'fattura'})
    # Create index: "PrimaryKey"
    add_index(:dettagli_fatture, :id, {:name => 'PrimaryKey', :unique => true})
  end

  def self.down
    drop_table :dettagli_fatture
  end
end
