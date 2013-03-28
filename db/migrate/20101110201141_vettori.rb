class Vettori < ActiveRecord::Migration
  def self.up
    create_table :vettori do |t|
      t.string :descrizione, :limit => 50, :default => "", :null => false
      t.string :via, :limit => 40, :default => "", :null => false
      t.string :citta, :limit => 50, :default => "", :null => false
      t.string :provincia, :limit => 2, :default => "", :null => false
      t.string :cap, :limit => 5, :default => "", :null => false
      t.string :telefono1, :limit => 15, :default => "", :null => false
      t.string :telefono2, :limit => 15, :default => "", :null => false
      t.string :telefono3, :limit => 15, :default => "", :null => false
      t.string :fax, :limit => 30, :default => "", :null => false
    end
    # Create index: "PrimaryKey"
    add_index(:vettori, :id, {:name => 'PrimaryKey', :unique => true})
    # Create index: "Vettore"
    add_index(:vettori, :descrizione, {:name => 'Vettore', :unique => true})
  end

  def self.down
    drop_table :vettori
  end
end
