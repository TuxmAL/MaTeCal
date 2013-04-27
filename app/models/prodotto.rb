class Prodotto < ActiveRecord::Base
  belongs_to :campagna
  belongs_to :modello
  belongs_to :unita

  attr_accessible :codice, :composizione, :descrizione, :iva, :prezzo_conformato, :prezzo_unitario

  validates_numericality_of :codice, :only_integer => true, :greater_than => 0
  validates_length_of :descrizione, :maximum => 50, :minimum => 1, :allow_blank => false, :allow_nil => false
  validates_length_of :composizione, :maximum => 100, :allow_blank => true, :allow_nil => true
  validates_numericality_of :iva, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100
  validates_numericality_of :prezzo_unitario, :greater_than_or_equal_to => 0, :allow_blank => false, :allow_nil => false
  validates_numericality_of :prezzo_conformato, :greater_than_or_equal_to => 0, :allow_blank => true, :allow_nil => true
  validates_uniqueness_of :codice
  validates_uniqueness_of :descrizione

end
