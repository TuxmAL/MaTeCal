# encoding: utf-8
require 'test_helper'

class CampagnaTest < ActiveSupport::TestCase

  def setup 
    @campagna = Campagna.new
  end

  test "campagna deve avere la descrizione" do
     assert !@campagna.save
   end

  test "la descrizione non puo essere vuota" do
    @campagna.descrizione = ''
    assert !@campagna.save
  end
  test "la descrizione non puo essere piu di 35 car" do
    @campagna.descrizione = 'descrizione più lunga di trentacinque caratteri per cui non è valida affatto'
    assert !@campagna.save
  end

  test "la descrizione non puo essere duplicata" do
    @campagna.descrizione = 'Primavera-Estate 2013'
    assert !@campagna.save
  end

end
