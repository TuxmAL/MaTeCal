# encoding: utf-8
class Campagna < ActiveRecord::Base
  attr_accessible :descrizione

  validates :descrizione, :length => { :maximum => 35, :minimum => 1 },
            :presence => true,
            :uniqueness => true
end
