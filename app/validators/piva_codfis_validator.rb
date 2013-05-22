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
class PivaCodfisValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    return if options[:allow_nil] && value.nil?
    return if options[:allow_blank] && value.blank?
    return record.errors.add(attribute, :invalid) if value.blank?
    if value.length == 11 && !!(value =~ /^\d+$/)
      message = valida_piva value
      record.errors.add(:partita_iva, message) unless message.nil?
    elsif value.length == 16  && !!(value =~ /^[[:alnum:]]+$/)
      message = valida_codfis value
      record.errors.add(:codice_fiscale, message) unless message.nil?
    else
      record.errors.add(attribute, :invalid)
    end
  end

  private

  def valida_piva(value)
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
    (cod_ctl == c.to_s) ? nil : 'partita iva con codice di controllo non valido.'
  end

  def valida_codfis(value)
    # l'indice parte da 0 e non da 1 e quindi inverto i codici pari e dispari.
    dispari = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
                'A' => 0, 'B' => 1, 'C' => 2, 'D' => 3, 'E' => 4, 'F' => 5, 'G' => 6, 'H' => 7, 'I' => 8, 'J' => 9,
                'K' => 10, 'L' => 11, 'M' => 12, 'N' => 13, 'O' => 14, 'P' => 15, 'Q' => 16, 'R' => 17, 'S' => 18,
                'T' => 19, 'U' => 20, 'V' => 21, 'W' => 22, 'X' => 23, 'Y' => 24, 'Z' => 25 };
    pari =    { '0' => 1, '1' => 0, '2' => 5, '3' => 7, '4' => 9, '5' => 13, '6' => 15, '7' => 17, '8' => 19, '9' => 21,
                'A' => 1, 'B' => 0, 'C' => 5, 'D' => 7, 'E' => 9, 'F' => 13, 'G' => 15, 'H' => 17, 'I' => 19, 'J' => 21,
                'K' => 2, 'L' => 4, 'M' => 18, 'N' => 20, 'O' => 11, 'P' => 3, 'Q' => 6, 'R' => 8, 'S' => 12,
                'T' => 14, 'U' => 16, 'V' => 10, 'W' => 22, 'X' => 25, 'Y' => 24, 'Z' => 23 }
    cod_fis = value.upcase.split('')
    cod_ctl = cod_fis.pop
    sum = 0
    cod_fis.each_with_index do |item, index|
      # index parte da 0 e non da 1 e quindi inverto il controllo fra pari e dispari.
      sum += (index.even?)? pari[item] : dispari[item]
    end
    (dispari[cod_ctl] == (sum % 26)) ? nil : 'codice fiscale con codice di controllo non valido.'
  end

end
