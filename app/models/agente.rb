class Agente < ActiveRecord::Base
  belongs_to :zona

  attr_accessible :cap, :citta, :codfis_piva, :cognome, :email, :fax, :nome, :provincia, :provvigione, :telefono1, :telefono2,
                  :telefono3, :via, :zona_id

  validates_length_of :cognome, :maximum => 30, :minimum => 1, :allow_blank => false, :allow_nil => false  validates_length_of :cognome, :maximum => 30, :minimum => 1, :allow_blank => false, :allow_nil => false
  validates_length_of :nome, :maximum => 25, :minimum => 1, :allow_blank => false, :allow_nil => false
  validates_length_of :via, :maximum => 40, :minimum => 1, :allow_blank => false, :allow_nil => false
  validates_length_of :citta, :maximum => 50, :minimum => 1, :allow_blank => false, :allow_nil => false
  validates_length_of :provincia, :is => 2, :allow_blank => false, :allow_nil => false
  validates_length_of :cap, :is => 5, :allow_blank => false, :allow_nil => false
  validates_length_of :telefono1, :maximum => 15, :minimum => 3, :allow_blank => true, :allow_nil => true
  validates_length_of :telefono2, :maximum => 15, :minimum => 3, :allow_blank => true, :allow_nil => true
  validates_length_of :telefono3, :maximum => 15, :minimum => 3, :allow_blank => true, :allow_nil => true
  validates_length_of :fax, :maximum => 30, :minimum => 3, :allow_blank => true, :allow_nil => true
  validates_length_of :email,:maximum => 30, :minimum => 6, :allow_blank => true, :allow_nil => true
  validates_length_of :codfis_piva,:maximum => 15, :minimum => 11, :allow_blank => false, :allow_nil => false
  validates_presence_of :zona_id

  #todo inserire i controlli sull'email e sul checksum della partita iva / codice fiscale.
end
