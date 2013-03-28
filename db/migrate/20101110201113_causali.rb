class Causali < ActiveRecord::Migration
  def self.up
    create_table :causali do |t|
      t.string :causale, :limit => 25, :null => false
      t.timestamps
    end
    # Create index: "Causale"
    add_index(:causali, :id, {:name => 'causale', :unique => true})
  end

  def self.down
    drop_table :causali
  end
end
