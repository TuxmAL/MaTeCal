# encoding: utf-8
require 'test_helper'

class ModelloTest < ActiveSupport::TestCase

  def setup
    @modello = Modello.new
  end

  test "modello deve avere la descrizione" do
    assert !@modello.save
  end

  test "la descrizione non puo essere vuota" do
    @modello.descrizione = ''
    assert !@modello.save
  end
  test "la descrizione non puo essere piu di 35 car" do
    @modello.descrizione = 'descrizione più lunga di trentacinque caratteri per cui non è valida affatto'
    assert !@modello.save
  end

  test "la descrizione non puo essere duplicata" do
    @modello.descrizione = 'Lupetto'
    assert !@modello.save
  end

end
