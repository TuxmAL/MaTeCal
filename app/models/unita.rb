# encoding: utf-8
class Unita < ActiveRecord::Base
  attr_accessible :unita

  validates :unita,  :length => { :maximum => 5, :minimum => 1 },
            :presence => true,
            :uniqueness => true

end
