# encoding: utf-8
class ModPag < ActiveRecord::Base
  attr_accessible :descrizione, :dilazione_iniziale, :num_rate, :scadenza, :sconto, :tipo_pagamento, :piu_sconto

  validates_length_of :descrizione, :maximum => 35, :minimum => 1, :allow_blank => false, :allow_nil => false
  validates_uniqueness_of :descrizione
  validates_inclusion_of :scadenza, :in => %w( I F ), :message => "Scadenza %{value} non valida."
  validates_inclusion_of :tipo_pagamento, :in => %w( D B ), :message => "Tipo pagamento %{value} non valido."
  validates_numericality_of :dilazione_iniziale, :only_integer => true,:greater_than_or_equal_to => 0
  validates_numericality_of :num_rate, :only_integer => true, :greater_than_or_equal_to => 0
  validates_numericality_of :sconto, :only_integer => true, :greater_than_or_equal_to => 0, :less_than => 100
  validates_numericality_of :piu_sconto, :only_integer => true, :greater_than_or_equal_to => 0, :less_than => 100

  def tipo_pagamento_esteso
    case tipo_pagamento
      when 'D'
        'Rimessa diretta'
      when 'B'
        'Ricevuta Bancaria'
      else
        fail "Tipo pagamento (#{tipo_pagamento}) non valido."
    end
  end

  def scadenza_estesa
    case scadenza
      when 'I'
        'Immediata'
      when 'F'
        'Fine mese'
      else
        fail "Scadenza (#{scadenza}) non valida."
    end
  end
end
