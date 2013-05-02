# encoding: utf-8
require 'test_helper'

class ProdottoTest < ActiveSupport::TestCase

  def setup
    @prodotto = prodotti(:orsetto)
    @mare = campagne(:mare)
    @pz = unita(:pz)
    @lup = modelli(:lup)
  end

  test "prodotto non puo essere vuoto" do
    assert !Prodotto.new.save
  end

  test "il codice non puo essere vuoto" do
    @prodotto.codice = nil
    assert !@prodotto.save
  end

  test "la descrizione non puo essere vuota" do
    @prodotto.descrizione = ''
    assert !@prodotto.save
  end

  test "la iva non può essere maggiore 100" do
    @prodotto.iva = 101
    assert !@prodotto.save
  end

  test "la iva non può essere minore di 0" do
    @prodotto.iva = -1
    assert !@prodotto.save
  end

  test "la descrizione non puo essere piu di 50 car" do
    @prodotto.descrizione = 'descrizione più lunga di cinquanta caratteri per cui non è valida affatto'
    assert !@prodotto.save
  end

  test "la composizione non puo essere piu di 100 car" do
    @prodotto.composizione = 'composizione con più di cento caratteri per cui non è valida affatto, ovviamente, ma la segnalazione di errore resta necessaria!'
    assert !@prodotto.save
  end
  test "il codice non puo essere duplicato" do
    pr = Prodotto.new
    pr.codice = 1001
    pr.descrizione= 'nuovo'
    pr.prezzo_unitario= 12.34
    pr.iva = 21
    pr.modello = @lup
    pr.campagna = @mare
    pr.unita = @pz
    assert !pr.save
  end

  test "la descrizione non puo essere duplicata" do
    pr = Prodotto.new
    pr.codice = 1
    pr.descrizione = 'Orsetto'
    pr.prezzo_unitario= 12.34
    pr.iva = 21
    pr.modello = @lup
    pr.campagna = @mare
    pr.unita = @pz
    assert !pr.save
  end

  test "non puo mancare la campagna" do
    @prodotto.campagna = nil
    assert !@prodotto.save
  end

  test "non puo mancare il modello" do
    @prodotto.modello = nil
    assert !@prodotto.save
  end

  test "non puo mancare la unita" do
    @prodotto.unita = nil
    assert !@prodotto.save
  end

end
