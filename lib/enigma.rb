require 'date'
require './lib/shift'


class Enigma
  include Shift

  def encrypt(plain_text, key = random_key, date = todays_date)
    shifts = calc_shifts(key, date) # calculates the A, B, C, D shifts. Ex: [1, 0, 2, 5]
    cipher_text = shift_text(plain_text, shifts) # shifts the plain text based on the shifts
    {encryption: cipher_text, key: key, date: date}
  end

  def decrypt(cipher_text, key, date = todays_date) # same as encrypt, just in reverse
    shifts = calc_shifts(key, date).map { |shift| shift * -1 }
    plain_text = shift_text(cipher_text, shifts)
    {decryption: plain_text, key: key, date: date}
  end

  def crack(cipher_text, date = todays_date)
    plain_text = ''
    until plain_text[-4..-1] == ' end'
      shifts = calc_shifts(key = self.random_key, date).map { |shift| shift * -1 } # same as decrypt but it uses a random key every time until the message it cracked
      plain_text = self.shift_text(cipher_text, shifts)
    end
    {decryption: plain_text, key: key, date: date}
  end

  def random_key # generates a random 5 digit integer but as a string. Ex: 00435, 59174
    rand(0..99999).to_s.rjust(5, '0')
  end

  def todays_date # generates todays date as a string DDMMYY
    Date.today.strftime('%d%m%y')
  end

end
