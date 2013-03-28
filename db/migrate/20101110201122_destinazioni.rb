class Destinazioni < ActiveRecord::Migration
  def self.up
    create_table :destinazioni do |t|
      t.references :clienti
      t.string :via, :limit => 40, :null => false
      t.string :citta, :limit => 50, :null => false
      t.string :provincia, :limit => 2, :null => false
      t.string :cap, :limit => 5, :null => false
      t.timestamps
    end
    # Create index: "PrimaryKey"
    add_index(:destinazioni, [:clienti_id, :id], {:name => 'primarykey', :unique => true})
  end

  def self.down
    drop_table :destinazioni
  end
end
