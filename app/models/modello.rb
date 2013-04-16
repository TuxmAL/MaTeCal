# encoding: utf-8
class Modello < ActiveRecord::Base
  attr_accessible :descrizione

  validates_presence_of :descrizione
  validates_uniqueness_of :descrizione
end
