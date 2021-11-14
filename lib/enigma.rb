require 'date'
require './lib/shift'


class Enigma
  include Shift

  def encrypt(plain_text, key = random_key, date = todays_date)
    shifts = shifts(key, date)
    cipher_text = shift_text(plain_text, shifts)
    {encryption: cipher_text, key: key, date: date}
  end

  def decrypt(cipher_text, key, date = todays_date)
    shifts = shifts(key, date).map { |shift| shift * -1 }
    plain_text = shift_text(cipher_text, shifts)
    {decryption: plain_text, key: key, date: date}
  end

  def crack(cipher_text, date = todays_date)
    plain_text = ''
    until plain_text[-4..-1] == ' end'
      shifts = shifts(key = self.random_key, date).map { |shift| shift * -1 }
      plain_text = self.shift_text(cipher_text, shifts)
    end
    {decryption: plain_text, key: key, date: date}
  end

  def random_key
    rand(0..99999).to_s.rjust(5, '0')
  end

  def todays_date
    Date.today.strftime('%d%m%y')
  end

end
