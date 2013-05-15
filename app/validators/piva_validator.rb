# encoding: utf-8

#  L'algoritmo impiegato per calcolare la cifra di controllo è la Formula di Luhn:
#    Detta X la somma delle prime cinque cifre in posizione dispari
#    Detta Y il doppio della somma delle cinque cifre in posizione pari
#    Sia Z il numero di cifre, in posizione pari, maggiori o uguali a 5
#    Detta T = (X + Y + Z) mod 10 l'unità corrispondente alla somma dei numeri sopra calcolati
#    Allora la cifra di controllo C := (10 - T) mod 10#
# Esempio:
# Si vuole verificare il codice di controllo della Partita IVA 07643520567:
# 0 7 6 4 3 5 2 0 5 6 C (dove C == 7 è il codice di controllo da verificare)#
#    X = 0 + 6 + 3 + 2 + 5 = 16 (somma delle cifre di posto dispari)
#    Y = 2 * (7 + 4 + 5 + 0 + 6) = 2 * 22 = 44 (doppio della somma delle cifre di posto pari)
#    Z = 3 (numero di cifre in posizione pari superiori o uguali a 5 - nell'esempio, 7, 5 e 6)
#    T = (16 + 44 + 3) mod 10 = 63 mod 10 = 3 (somma modulo 10)
#    C = (10 - T) mod 10 = 7 (unità mancanti alla prima decina successiva)
class EmailValidator < ActiveModel::EachValidator  

  def validate_each(record, attribute, value)
    if value.length == 11 && !!(value =~ /^\d+$/)
      message = valida_piva value
      record.errors.add(attribute, message) unless message.nil?
    elsif value.length == 16  && !!(value !~ /^\d+$/)
      message = valida_codfis value
    else
      record.errors.add(attribute, :invalid)
    end
  end

  private

  def piva_valida(value)
    piva = value.split('')
    cod_ctl = piva.pop
    x = 0
    y = 0
    z = 0
    piva.each_with_index do |item, index|
      # index parte da 0 e non da 1 e quindi inverto il controllo fra pari e dispari.
      if index.even?
        x += item.to_i
      else
        y += 2 * item.to_i
        z += (item.to_i >= 5)? 1 : 0
      end
    end
    c = (10 - ((x + y + z) % 10)) % 10
    (cod_ctl == c.to_s)? nil: 'ha il codice di controllo non valido.'
  end

  def piva_valida(value)
    return 'da implementare!'
  end

  end
