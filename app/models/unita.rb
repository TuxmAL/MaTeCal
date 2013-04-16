# encoding: utf-8
class Unita < ActiveRecord::Base
  attr_accessible :unita

  validates_presence_of :unita
  validates_uniqueness_of :unita

end
