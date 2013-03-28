class Zone < ActiveRecord::Migration
  def self.up
    create_table :zone do |t|
      t.string :descrizione, :limit => 35, :null => false
      t.timestamps
    end
    # Create index: "PrimaryKey"
    add_index(:zone, :id, {:name => 'PrimaryKey', :unique => true})
    # Create index: "Zonadescr"
    add_index(:zone, :descrizione, {:name => 'Zonadescr', :unique => true})
  end

  def self.down
    drop_table :zone
  end
end
