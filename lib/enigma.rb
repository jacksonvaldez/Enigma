require 'date'


class Enigma

  attr_reader :char_set

  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  def encrypt(plain_text, key = random_key, date = todays_date)
    shifts = shifts(key, date)
    cipher_text = self.shift_text(plain_text, shifts)
    {encryption: cipher_text, key: key, date: date}
  end

  def decrypt(cipher_text, key, date = todays_date)
    shifts = shifts(key, date).map { |shift| shift * -1 }
    plain_text = self.shift_text(cipher_text, shifts)
    {decryption: plain_text, key: key, date: date}
  end

  def shift_text(text, shifts)
    counter = -1
    text.chars.map do |char|
      @char_set.include?(char) ? shift_char(char, shifts[(counter += 1) % 4]) : char
    end.join
  end

  def shift_char(char, shift_num)
    index = (@char_set.index(char) + shift_num) % @char_set.length
    @char_set[index]
  end

  def shifts(key, date)
    keys = key.chars.each_cons(2).map { |char_x, char_y| (char_x + char_y).to_i }
    offsets = date.to_i.pow(2).to_s.chars[-4..-1].map { |str| str.to_i }
    [keys, offsets].transpose.map { |key, offset| key + offset }
  end

  def random_key
    rand(0..99999).to_s.rjust(5, '0')
  end

  def todays_date
    Date.today.strftime('%d%m%y')
  end

end
