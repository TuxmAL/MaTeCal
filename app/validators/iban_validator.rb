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
class IbanValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    return if options[:allow_nil] && value.nil?
    return if options[:allow_blank] && value.blank?

    record.errors.add(attribute, :invalid) unless check_iban(value)
  end

private

  # Controllo di esattezza del codice IBAN; il controllo è più preciso del semplice checksum
  # (vedi http://en.wikipedia.org/wiki/International_Bank_Account_Number#Validating_the_IBAN),
  # ma meno accurato di quello effettuato in http://www.tbg5-finance.org/?ibandocs.shtml
  # dal cui sorgente è stato tratto il codice qui usato

  def check_iban(iban)
    illegale = /\W|_/ # contiene caratteri diversi da [a-zA-Z0-9]?
    return false if illegale.match iban # se sì, esci con errore
    legale = /^\D\D\d\d.+/ # i primi quattro caratteri sono _lettera_ _lettera_ _cifra_ _cifra_
    return false unless legale.match(iban) # esci con errore se non è così
    illegale = /^\D\D00.+|^\D\D01.+|^\D\D99.+/ # i check digit sono 00 o 01 o 99
    return false if illegale.match iban # esci con errore se è così
    # altrimenti calcola il resto dopo aver trasformato la stringa in numero intero
    iso7064mod97_10(iban) == 1 # esci controllando se il resto ritornato è 1 (IBAN valido)
  end

  def iso7064mod97_10(iban)
    iban.upcase
      .split('')
      .rotate(4)
      .map { |i| (i.match /\D/) ? (i.ord - 55).to_s : i }
      .join
      .to_i % 97
  end

end
