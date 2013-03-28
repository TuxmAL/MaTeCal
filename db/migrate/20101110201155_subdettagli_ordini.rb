class SubdettagliOrdini < ActiveRecord::Migration
  def self.up
    create_table :subdettagli_ordini do |t|
      t.references :dettagli_ordini, :null => false
      t.integer :taglia, :null => false
      t.decimal :quantita, :precision => 8, :scale => 4, :null => false
      t.decimal :qta_evasa, :precision => 8, :scale => 4, :null => false
      t.timestamps
    end
    # Create index: "PrimaryKey"
    add_index(:subdettagli_ordini, :id, {:name => 'PrimaryKey', :unique => true})
    # Create index: "Taglie nell'ordine"
    add_index(:subdettagli_ordini, [:dettagli_ordini_id, :taglia], {:name => 'Taglie in ordine'})
  end

  def self.down
    drop_table :subdettagli_ordini
  end
end
