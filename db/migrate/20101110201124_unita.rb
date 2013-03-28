class Unita < ActiveRecord::Migration
  def self.up
    create_table :unita do |t|
      t.string :unita, :limit => 5, :null => true
    end
    # Create index: "PrimaryKey"
    add_index(:unita, :id, {:name => 'PrimaryKey', :unique => true})
    # Create index: "Unita"
    add_index(:unita, :unita, {:name => 'Unita', :unique => true})
  end

  def self.down
    drop_table :unita
  end
end
