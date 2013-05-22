# encoding: utf-8
class Cliente < ActiveRecord::Base
  belongs_to :zona
  belongs_to :mod_pag

  attr_accessible :agenzia, :banca, :cap, :citta, :codfis_piva, :email, :fax, :iban, :note, :provincia,
                  :ragione_sociale, :telefono1, :telefono2, :telefono3, :via, :zona_id, :mod_pag_id

  validates :ragione_sociale, :length => { :maximum => 50, :minimum => 1 },
            :presence => true
  validates :via, :length => { :maximum => 40, :minimum => 1 },
            :presence => true
  validates :citta, :length => { :maximum => 50, :minimum => 1 },
            :presence => true
  validates :provincia, :length => { :is => 2 },
            :presence => true
  validates :cap, :length => { :is => 5 },
            :presence => true
  validates :telefono1, :length => { :maximum => 15 }
  validates :telefono2, :length => { :maximum => 15 }
  validates :telefono3, :length => { :maximum => 15 }
  validates :fax, :length => { :maximum => 30 }
  validates :email, :email => true,  :length => { :maximum => 30 },
            :allow_nil => true, :allow_blank => true
  validates :codfis_piva, :piva_codfis => true, :length => { :maximum => 16, :minimum => 11 },
            :presence => true
  validates :banca, :length => { :maximum => 40, :minimum => 1 },
            :presence => true
  validates :agenzia, :length => { :maximum => 120, :minimum => 1 },
            :presence => true
  validates :iban, :iban => true, :length => { :maximum => 37 },
            :presence => true
  validates :zona_id, :presence => true
  validates :mod_pag_id, :presence => true
end
