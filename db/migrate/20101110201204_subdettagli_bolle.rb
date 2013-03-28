class SubdettagliBolle < ActiveRecord::Migration
  def self.up
    create_table :subdettagli_bolle do |t|
      t.references :dettagli_bolle, :null => false
      t.references :subdettaglio_ord, :null => false
      t.integer :taglia, :null => false
      t.decimal :quantita, :precision => 8, :scale => 4, :null => false
      t.timestamps
    end
    # Create index: "IDDettaglioBolla"
    add_index(:subdettagli_bolle, :dettagli_bolle_id, {:name => 'IDDettaglioBolla', :unique => false})
    # Create index: "PrimaryKey"
    add_index(:subdettagli_bolle, :id, {:name => 'PrimaryKey', :unique => true})
  end

  def self.down
    drop_table :subdettagli_bolle
  end
end
