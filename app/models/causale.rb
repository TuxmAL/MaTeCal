# encoding: utf-8
class Causale < ActiveRecord::Base
  attr_accessible :causale

  validates :causale, :length => { :maximum => 35, :minimum => 1 },
            :presence => true,
            :uniqueness => true
end
