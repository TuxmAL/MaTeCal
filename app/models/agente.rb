class Agente < ActiveRecord::Base
  belongs_to :zona
  attr_accessible :cap, :citta, :codfis_piva, :cognome, :fax, :nome, :provincia, :provvigione, :telefono1, :telefono2,
                  :telefono3, :via, :zona_id

  #todo inserire tutti i controlli sui campi relativi agli agenti.
end
