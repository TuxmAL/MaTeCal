# encoding: utf-8
require 'test_helper'

class UnitaTest < ActiveSupport::TestCase

  def setup
    @unita = Unita.new
  end

  test "unita deve avere la @unita" do
    assert !@unita.save
  end

  test "l'unita non puo essere vuota" do
    @unita.unita = ''
    assert !@unita.save
  end
  test "l'unita non puo essere piu di 5 car" do
    @unita.unita = 'unità più lunga di cinque caratteri per cui non è valida affatto'
    assert !@unita.save
  end

  test "l'unita non puo essere duplicata" do
    @unita.unita = 'Kg.'
    assert !@unita.save
  end

end
