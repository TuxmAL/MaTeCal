class DettagliBolle < ActiveRecord::Migration
  def self.up
    create_table :dettagli_bolle do |t|
      t.references :bolle, :null => false
      t.references :dettagli_ordini
      t.references :prodotti, :null => false
      t.integer :VarianteColore
      t.decimal :quantita, :precision => 8, :scale => 4, :null => false
      t.timestamps
    end
    # Create index: "PrimaryKey"
    add_index(:dettagli_bolle, :id, {:name => 'PrimaryKey', :unique => true})
  end

  def self.down
    drop_table :dettagli_bolle
  end
end
