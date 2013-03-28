class Bolle < ActiveRecord::Migration
  def self.up
    create_table :bolle do |t|
      t.integer :numero, :null => false
      t.integer :anno, :null => false #, :default => "year(date())"
      t.datetime :data, :null => false #, :default => "today()"
      t.integer :provvigione
      t.references :agenti
      t.references :clienti, :null => false
      t.references :destinazioni, :null => true
      t.references :vettori, :null => true
      t.references :mod_pag, :null => false
      t.references :causali, :null => false
      t.integer :trasporto, :default => 0, :null => false
      t.integer :colli, :default => 0, :null => false
      t.integer :aspetto, :default => 0, :null => false
      t.text :note, :null => true
      t.timestamps
    end
  # Create index: "BolleIDVettore"
    add_index(:bolle, :vettori_id, {:name => 'BolleIDVettore'})
    # Create index: "Destinazione"
    add_index(:bolle, [:clienti_id, :destinazioni_id], {:name => 'Destinazione', :unique => true})
    # Create index: "Per data"
    add_index(:bolle, :data, {:name => 'Per data'})
    # Create index: "Per numero"
    add_index(:bolle, [:anno, :numero], {:name => 'Per numero', :unique => true})
    # Create index: "PrimaryKey"
    add_index(:bolle, :id, {:name => 'PrimaryKey', :unique => true})
  end

  def self.down
    drop_table :bolle
  end
end
