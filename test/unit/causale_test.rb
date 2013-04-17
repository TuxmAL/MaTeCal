# encoding: utf-8
require 'test_helper'

class CausaleTest < ActiveSupport::TestCase

  def setup
    @causale = Causale.new    
  end
  
  test "causale deve avere la causale" do
    assert !@causale.save
  end

  test "la causale non puo essere vuota" do
    @causale.causale = ''
    assert !@causale.save
  end
  test "la causale non puo essere piu di 35 car" do
    @causale.causale = 'causale più lunga di trentacinque caratteri per cui non è valida affatto'
    assert !@causale.save
  end

  test "la causale non puo essere duplicata" do
    @causale.causale = 'Campionario'
    assert !@causale.save
  end

end
