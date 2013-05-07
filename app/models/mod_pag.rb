# encoding: utf-8
class ModPag < ActiveRecord::Base
  attr_accessible :descrizione, :dilazione_iniziale, :num_rate, :scadenza, :sconto, :tipo_pagamento, :piu_sconto

  validates :descrizione, :length => { :maximum => 35, :minimum => 1 },
            :presence => true,
            :uniqueness => true
  validates :scadenza, :inclusion => { :in => %w( I F ), :message => "Scadenza %{value} non valida." }
  validates :tipo_pagamento, :inclusion => { :in => %w( D B ), :message => "Tipo pagamento %{value} non valido." }
  validates :dilazione_iniziale, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :num_rate, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :sconto, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than => 100 }
  validates :piu_sconto, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than => 100 }

  def tipo_pagamento_esteso
    case tipo_pagamento.upcase
      when 'D'
        'Rimessa diretta'
      when 'B'
        'Ricevuta Bancaria'
      else
        fail "Tipo pagamento (#{tipo_pagamento}) non valido."
    end
  end

  def scadenza_estesa
    case scadenza.upcase
      when 'I'
        'Immediata'
      when 'F'
        'Fine mese'
      else
        fail "Scadenza (#{scadenza}) non valida."
    end
  end
end
