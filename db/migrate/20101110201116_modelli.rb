class Modelli < ActiveRecord::Migration
  def self.up
     create_table :modelli do |t|
      t.string :descrizione, :limit => 35, :null => false
      t.timestamps
    end
    # create index: "primarykey"
    add_index(:modelli, :id, {:name => 'modello', :unique => true})
 end

  def self.down
    drop_table :modelli
  end
end
