class UltimiDoc < ActiveRecord::Migration
  def self.up
    create_table(:ultimi_doc, :primarykey => :anno) do |t|
#    create_table :ultimi_doc do |t|
      t.integer :anno, :null => false #, :null => true #, :default => "Year(Now())"
      t.integer :ord_num, :default => 0, :null => true
      t.integer :bolla_num, :default => 0, :null => true
      t.integer :fatt_num, :default => 0, :null => true
      t.timestamps
    end
    # Create index: "PrimaryKey"
    add_index(:ultimi_doc, :anno, {:name => 'PrimaryKey', :unique => true})
  end

  def self.down
    drop_table :ultimi_doc
  end
end
