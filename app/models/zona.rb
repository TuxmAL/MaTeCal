# encoding: utf-8
class Zona < ActiveRecord::Base
  attr_accessible :descrizione

  validate validates_presence_of :descrizione
  validates_uniqueness_of :descrizione
end
