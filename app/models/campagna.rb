# encoding: utf-8
class Campagna < ActiveRecord::Base
  attr_accessible :descrizione

  validates_length_of :descrizione, :maximum => 35, :minimum => 1, :allow_blank => false, :allow_nil => false
  validates_uniqueness_of :descrizione
end
