#encoding:  utf-8
require 'test_helper'

class AgenteTest < ActiveSupport::TestCase
  #todo inserire test per controllo della partita iva / codice fiscale.

  def setup
    @agente = agenti(:esposito)
  end

  test "agente non puo essere vuoto" do
    assert !Agente.new.save
  end

  test "il cognome non puo essere vuoto" do
    @agente.cognome = ''
    assert !@agente.save
  end

  test "il cognome non puo essere mancante" do
    @agente.cognome = nil
    assert !@agente.save
  end

  test "il cognome non puo essere piu di 30 car" do
    @agente.cognome  = 'cognome più lungo di trenta (dico 30) caratteri per cui non è valido affatto'
    assert !@agente.save
  end

  test "il nome non puo essere vuoto" do
    @agente.nome = ''
    assert !@agente.save
  end

  test "il nome non puo essere mancante" do
    @agente.nome = nil
    assert !@agente.save
  end

  test "il nome non puo essere piu di 25 car" do
    @agente.nome  = 'nome più lungo di 25 (dico venticinque) caratteri per cui non è valido affatto'
    assert !@agente.save
  end

  test "la via non puo essere vuota" do
    @agente.via = ''
    assert !@agente.save
  end

  test "la via non puo essere mancante" do
    @agente.via = nil
    assert !@agente.save
  end

  test "la via non puo essere piu di 40 car" do
    @agente.nome  = 'via più lunga di 40 (dico quaranta) caratteri per cui non è valida affatto'
    assert !@agente.save
  end

  test "la citta non puo essere vuota" do
    @agente.citta = ''
    assert !@agente.save
  end

  test "la citta non puo essere mancante" do
    @agente.citta = nil
    assert !@agente.save
  end

  test "la citta non puo essere piu di 50 car" do
    @agente.citta  = 'città più lunga di 50 (dico cinquanta) caratteri per cui non è valida affatto'
    assert !@agente.save
  end

  test "la provincia non puo essere vuota" do
    @agente.provincia = ''
    assert !@agente.save
  end

  test "la provincia non puo essere mancante" do
    @agente.provincia = nil
    assert !@agente.save
  end

  test "la provincia non puo diversa da 2 car" do
    @agente.provincia  = 'provincia più lunga di 2 (dico due) caratteri per cui non è valida affatto'
    assert !@agente.save
    @agente.provincia  = '1'
    assert !@agente.save
  end

  test "il cap non puo essere vuota" do
    @agente.cap = ''
    assert !@agente.save
  end

  test "il cap non puo essere mancante" do
    @agente.cap = nil
    assert !@agente.save
  end

  test "il cap non puo diverso da 5 car" do
    @agente.cap  = 'cap più lungo di 5 caratteri per cui non è valida affatto'
    assert !@agente.save, '> 5 caratteri'
    @agente.provincia  = '1234'
    assert !@agente.save, '4 caratteri.'
    @agente.provincia  = '123'
    assert !@agente.save, '3 caratteri.'
    @agente.provincia  = '12'
    assert !@agente.save, '2 caratteri.'
    @agente.provincia  = '1'
    assert !@agente.save, '1 carattere.'
  end

  test "email mancante valida" do
    @agente.email = nil
    assert @agente.save
  end

  test "email vuota valida" do
    @agente.email = ''
    assert @agente.save
  end

  test "fax mancante valida" do
    @agente.fax = nil
    assert @agente.save
  end

  test "fax vuota valida" do
    @agente.fax = ''
    assert @agente.save
  end

  test "telefoni mancanti validi" do
    @agente.telefono1 = nil
    assert @agente.save, 'telefono1 è nil'
    @agente.telefono2 = nil
    assert @agente.save, 'telefono2 è nil'
    @agente.telefono3 = nil
    assert @agente.save, 'telefono3 è nil'
  end

  test "Telefoni vuoti validi" do
    @agente.telefono1 = ''
    assert @agente.save, 'telefono1 è \'\''
    @agente.telefono2 = ''
    assert @agente.save, 'telefono2 è \'\''
    @agente.telefono3 = ''
    assert @agente.save, 'telefono3 è \'\''
  end

  test "zona mancante" do
    @agente.zona = nil
    assert !@agente.save
  end

end
