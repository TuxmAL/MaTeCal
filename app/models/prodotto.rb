class Prodotto < ActiveRecord::Base
  belongs_to :campagna
  belongs_to :modello
  belongs_to :unita

  attr_accessible :codice, :composizione, :descrizione, :iva, :prezzo_conformato, :prezzo_unitario, :campagna_id,
                  :modello_id, :unita_id

  validates :codice, :numericality => { :only_integer => true, :greater_than => 0 },
            :uniqueness => true
  validates :descrizione, :length => { :maximum => 50, :minimum => 1 },
            :presence => true,
            :uniqueness => true
  validates :composizione, :length => { :maximum => 100 }
  validates :iva, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100 },
            :presence => true
  validates :prezzo_unitario, :numericality => { :greater_than_or_equal_to => 0 },
            :presence => true
  validates :prezzo_conformato, :numericality => { :greater_than_or_equal_to => 0 }, :allow_nil => true
  validates :campagna_id, :presence => true
  validates :modello_id, :presence => true
  validates :unita_id, :presence => true

end
