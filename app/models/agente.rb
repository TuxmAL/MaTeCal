class Agente < ActiveRecord::Base
  belongs_to :zona

  attr_accessible :cap, :citta, :codfis_piva, :cognome, :email, :fax, :nome, :provincia, :provvigione, :telefono1, :telefono2,
                  :telefono3, :via, :zona_id

  validates :cognome, :length => { :maximum => 30, :minimum => 1 },
            :presence => true
  validates :cognome, :length => { :maximum => 30, :minimum => 1 },
            :presence => true
  validates :nome, :length => { :maximum => 25, :minimum => 1 },
            :presence => true
  validates :via, :length => { :maximum => 40, :minimum => 1 },
            :presence => true
  validates :citta, :length => { :maximum => 50, :minimum => 1 },
            :presence => true
  validates :provincia, :length => { :is => 2 },
            :presence => true
  validates :cap, :length => { :is => 5 },
            :presence => true
  validates :telefono1, :length => { :maximum => 15, :minimum => 3 }
  validates :telefono2, :length => { :maximum => 15, :minimum => 3 }
  validates :telefono3, :length => { :maximum => 15, :minimum => 3 }
  validates :fax, :length => { :maximum => 30, :minimum => 3 }
  validates :email, :length => { :maximum => 30, :minimum => 6 }
  #validates :email, :presence => false, :email => true
  validates :codfis_piva, :length => { :maximum => 15, :minimum => 11 },
            :presence => true
  validates :zona_id, :presence => true

  #todo inserire i controlli sull'email e sul checksum della partita iva / codice fiscale.
end
