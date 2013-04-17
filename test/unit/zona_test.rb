# encoding: utf-8
require 'test_helper'

class ZonaTest < ActiveSupport::TestCase

  def setup
    @zona = Zona.new
  end

  test "zona deve avere la descrizione" do
    assert !@zona.save
  end

  test "la descrizione non puo essere vuota" do
    @zona.descrizione = ''
    assert !@zona.save
  end
  test "la descrizione non puo essere piu di 35 car" do
    @zona.descrizione = 'descrizione più lunga di trentacinque caratteri per cui non è valida affatto'
    assert !@zona.save
  end

  test "la descrizione non puo essere duplicata" do
    @zona.descrizione = 'Napoli'
    assert !@zona.save
  end

end
