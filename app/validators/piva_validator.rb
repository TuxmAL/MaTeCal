# To change this template, choose Tools | Templates
# and open the template in the editor.

class EmailValidator < ActiveModel::EachValidator  

  def validate_each(record, attribute, value)
    piva = value
    if value.to_s.length = 11
      x = 0
      y = 0
      z = 0
      value.to_s[1..10].each_with_index do |item, index| 
        if index.odd?
          x += item.to_i 
        else
          y += 2 * item.to_i
          z += (item.to_i >= 5)? 1 : 0
        end        
      end
      t = (x + y + z) % 10
      c = (10 - t) % 10
      if value.to_s[11] != c.to_s
        record.errors.add(attribute, ' ha il codice di controllo non valido.')
      end
    else
      record.errors.add(attribute, :invalid)
    end
  end

#  L'algoritmo impiegato per calcolare la cifra di controllo è la Formula di Luhn:
#
#    Sia X la somma delle prime cinque cifre in posizione dispari
#    Sia Y il doppio della somma delle cinque cifre in posizione pari
#    Sia Z il numero di cifre, in posizione pari, maggiori o uguali a 5
#    Sia T=(X+Y+Z) mod 10 l#'unità corrispondente alla somma dei numeri sopra calcolati
#    Allora la cifra di controllo C = (10-T) mod 10
#
#Esempio:
#
#Si vuole calcolare il codice di controllo C della Partita IVA 0764352056C:
#
#0 7 6 4 3 5 2 0 5 6 C (dove C è il codice di controllo da individuare)
#
#    X = 0+6+3+2+5 = 16 (somma delle cifre di posto dispari)
#    Y = 2*(7+4+5+0+6) = 2*22 = 44 (doppio della somma delle cifre di posto pari)
#    Z = 3 (numero di cifre in posizione pari superiori o uguali a 5 - nell'esempio, 7, 5 e 6)
#    T = (16+44+3) mod 10 = 63 mod 10 = 3 (somma modulo 10)
#    C = (10-T) mod 10 = 7 (unità mancanti alla prima decina successiva)
#
#end
  