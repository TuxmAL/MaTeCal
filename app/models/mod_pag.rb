# encoding: utf-8
class ModPag < ActiveRecord::Base
  attr_accessible :descrizione, :dilazione_iniziale, :num_rate, :scadenza, :sconto, :tipo_pagamento, :piu_sconto

  validates_length_of :descrizione, :maximum => 35, :minimum => 1, :allow_blank => false, :allow_nil => false
  validates_uniqueness_of :descrizione

end
