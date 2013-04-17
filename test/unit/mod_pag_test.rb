# encoding: utf-8
require 'test_helper'

class ModPagTest < ActiveSupport::TestCase

  def setup
    @mod_pag = ModPag.new
    @mod_pag.descrizione = 'Assegno'
    @mod_pag.dilazione_iniziale = 3
    @mod_pag.num_rate = 0
    @mod_pag.scadenza = 'I'
    @mod_pag.sconto = 0
    @mod_pag.tipo_pagamento = 'D'
    @mod_pag.piu_sconto = 0
  end

  test "mod_pag deve avere la descrizione" do
    @mod_pag.descrizione = nil
    assert !@mod_pag.save
  end

  test "la descrizione non puo essere vuota" do
    @mod_pag.descrizione = ''
    assert !@mod_pag.save
  end
  test "la descrizione non puo essere piu di 35 car" do
    @mod_pag.descrizione = 'descrizione più lunga di trentacinque caratteri per cui non è valida affatto'
    assert !@mod_pag.save
  end

  test "la descrizione non puo essere duplicata" do
    @mod_pag.descrizione = 'Contanti'
    assert !@mod_pag.save
  end

  test "la scadenza deve essere I o F" do
    @mod_pag.scadenza = 'X'
    assert !@mod_pag.save
  end

  test "la scadenza non deve essere nil" do
    @mod_pag.scadenza = nil
    assert !@mod_pag.save
  end

  test "la scadenza non deve essere vuota" do
    @mod_pag.scadenza = ''
    assert !@mod_pag.save
  end

  test "il tipo pagamento deve essere D o B" do
    @mod_pag.tipo_pagamento = 'X'
    assert !@mod_pag.save
  end

  test "il tipo pagamento non deve essere nil" do
    @mod_pag.tipo_pagamento = nil
    assert !@mod_pag.save
  end

  test "il tipo pagamento non deve essere vuoto" do
    @mod_pag.tipo_pagamento = ''
    assert !@mod_pag.save
  end

  test "la dilazione iniziale deve essere >= 0" do
    @mod_pag.dilazione_iniziale = -1
    assert !@mod_pag.save
  end

  test "la dilazione iniziale deve essere un intero" do
    @mod_pag.dilazione_iniziale = 0.5
    assert !@mod_pag.save
  end

  test "il numero di rate deve essere >= 0" do
    @mod_pag.num_rate = -1
    assert !@mod_pag.save
  end

  test "il numero di rate deve essere un intero" do
    @mod_pag.num_rate = 1.5
    assert !@mod_pag.save
  end

  test "lo sconto deve essere >= 0" do
    @mod_pag.sconto = -1
    assert !@mod_pag.save
  end

  test "lo sconto deve essere un intero" do
    @mod_pag.sconto = 1.5
    assert !@mod_pag.save
  end

  test "lo sconto deve essere < 100" do
    @mod_pag.sconto = 100
    assert !@mod_pag.save
  end

  test "lo sconto ult. deve essere >= 0" do
    @mod_pag.piu_sconto = -1
    assert !@mod_pag.save
  end

  test "lo sconto ult. deve essere un intero" do
    @mod_pag.piu_sconto = 1.5
    assert !@mod_pag.save
  end

  test "lo sconto ult. deve essere < 100" do
    @mod_pag.piu_sconto = 100
    assert !@mod_pag.save
  end

  test 'Scadenza estesa è Immediata' do
    @mod_pag.scadenza = 'i'
    assert_equal 'Immediata', @mod_pag.scadenza_estesa
  end

  test 'Scadenza estesa è Fine mese' do
    @mod_pag.scadenza = 'f'
    assert_equal 'Fine mese', @mod_pag.scadenza_estesa
  end

  test 'Scadenza estesa è sconosciuta' do
    @mod_pag.scadenza = 'x'
    assert_raise RuntimeError do
      @mod_pag.scadenza_estesa
    end
  end

  test 'Tipo pagamento esteso è Rimessa diretta' do
    @mod_pag.tipo_pagamento= 'd'
    assert_equal 'Rimessa diretta', @mod_pag.tipo_pagamento_esteso
  end

  test 'Tipo pagamento esteso è Ricevuta Bancaria' do
    @mod_pag.tipo_pagamento = 'b'
    assert_equal 'Ricevuta Bancaria', @mod_pag.tipo_pagamento_esteso
  end

  test 'Tipo pagamento esteso è sconosciuto' do
    @mod_pag.tipo_pagamento = 'x'
    assert_raise RuntimeError do
      @mod_pag.tipo_pagamento_esteso
    end
  end

end
