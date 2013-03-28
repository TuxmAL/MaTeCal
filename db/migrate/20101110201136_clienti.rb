class Clienti < ActiveRecord::Migration
  def self.up
    create_table :clienti do |t|
      t.string :ragione_sociale, :limit => 50, :null => false
      t.string :via, :limit => 40, :null => false
      t.string :citta, :limit => 50, :null => false
      t.string :provincia, :limit => 2, :null => false
      t.string :cap, :limit => 5, :null => false
      t.references :zona, :null => false
      t.string :telefono1, :limit => 15, :null => true
      t.string :telefono2, :limit => 15, :null => true
      t.string :telefono3, :limit => 15, :null => true
      t.string :fax, :limit => 30, :null => true
      t.string :codfis_piva, :limit => 16, :null => false
      t.string :banca, :limit => 40, :null => false
      t.string :agenzia, :limit => 120, :null => false
      t.string :iban, :limit => 27, :null => false
      t.references :mod_pag, :null => false
      t.text :note, :null => true
      t.timestamps
    end
    # Create index: "PrimaryKey"
    add_index(:clienti, :id, {:name => 'PrimaryKey', :unique =>true})
    # Create index: "RagioneSociale"
    add_index(:clienti, :ragione_sociale, {:name => 'RagioneSociale'})
  end

  def self.down
    drop_table :clienti
  end
end
