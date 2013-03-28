class Campagne < ActiveRecord::Migration
  def self.up
    create_table :campagne do |t|
      t.string :descrizione, :limit => 50, :null => false
      t.timestamps
    end
    # Create index: "PrimaryKey"
    add_index(:campagne, :id, {:name => 'campagna', :unique => true})
  end

  def self.down
    drop_table :campagne
  end
end
