class Magazzino < ActiveRecord::Migration
  def self.up
    create_table :magazzino do |t|
      t.references :prodotto, :null => false
      t.references :campagna, :null => false
      t.integer :taglia, :null => false
      t.boolean :conformato, :null => false
      t.decimal :qta_resa, :precision => 8, :scale => 4, :null => false
      t.decimal :qta, :precision => 8, :scale => 4, :null => false
      t.timestamps
    end
    # Create index: "IDProdottoInCampagna"
    add_index(:magazzino, [:prodotto_id, :campagna_id, :taglia], {:name => 'IDProdottoInCampagna', :unique => true})
    # Create index: "PrimaryKey"
    add_index(:magazzino, :id, {:name => 'PrimaryKey', :unique => true})
  end

  def self.down
    drop_table :magazzino
  end
end
