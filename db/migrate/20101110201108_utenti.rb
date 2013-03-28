class Utenti < ActiveRecord::Migration
  def self.up
    create_table :utenti do |t|
      t.string :identificativo, :limit => 15, :null => false
      t.string :password, :limit => 15, :null => false
      t.string :descrizione, :limit => 50, :null => true
      t.integer :livello, :default => 0, :null => false
    end
    # Create index: "IDUtente"
    add_index(:utenti, :id, {:name => 'IDUtente', :unique => true})
    # Create index: "PrimaryKey"
    add_index(:utenti, :identificativo, {:name => 'PrimaryKey', :unique => true})
  end

  def self.down
    drop_table :utenti
  end
end
