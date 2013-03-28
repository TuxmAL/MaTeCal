class Ordini < ActiveRecord::Migration
  def self.up
    create_table :ordini do |t|
      t.integer :numero, :null => false
      t.integer :anno, :null => false #, :default => "Year(Date())"
      t.datetime :data, :null => false #, :default => "Date()"
      t.string :periodo_consegna, :limit => 10, :null => false
      t.references :cliente
      t.references :destinazione
      t.references :agente
      t.integer :provvigione, :null => false
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
  end

  def self.down
    drop_table :ordini
  end
end
