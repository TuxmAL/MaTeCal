# encoding: utf-8
class Causale < ActiveRecord::Base
  attr_accessible :causale

  validates_length_of :causale, :maximum => 35, :minimum => 1, :allow_blank => false, :allow_nil => false
  validates_uniqueness_of :causale
end
