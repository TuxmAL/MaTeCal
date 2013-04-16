# encoding: utf-8
class Unita < ActiveRecord::Base
  attr_accessible :unita

  validates_length_of :unita, :maximum => 5, :minimum => 1, :allow_blank => false, :allow_nil => false
  validates_uniqueness_of :unita

end
