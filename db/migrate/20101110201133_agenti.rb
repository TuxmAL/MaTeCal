class Agenti < ActiveRecord::Migration
  def self.up
    create_table :agenti do |t|
      t.string :cognome, :limit => 30, :null => false
      t.string :nome, :limit => 25, :null => false
      t.string :via, :limit => 40, :null => false
      t.string :citta, :limit => 50, :null => false
      t.string :provincia, :limit => 2, :null => false
      t.string :cap, :limit => 5, :null => false
      t.references :zona, :null => false
      t.string :telefono1, :limit => 15, :null => true
      t.string :telefono2, :limit => 15, :null => true
      t.string :telefono3, :limit => 15, :null => true
      t.string :fax, :limit => 30, :null => true
      t.string :codfis_piva, :limit => 15, :null => false
      t.integer :provvigione, :default => "0", :null => false
      t.timestamps
    end
    # Create index: "cognome_nome"
    add_index(:agenti, [:cognome, :nome], {:name => 'cognome_nome'})
    # Create index: "primarykey"
    add_index(:agenti, :id, {:name => 'primarykey', :unique => true})
  end

  def self.down
    drop_table :agenti
  end
end
