require 'date'


class Enigma

  attr_reader :char_set

  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  def encrypt(plain_text, key = random_key, date = todays_date)
    counter = -1
    shifts = shifts(key, date)
    cipher_text = plain_text.chars.map do |char|
      if @char_set.include?(char)
        counter += 1
        shift(char, shifts[counter % 4])
      else
        char
      end
    end.join
    {encryption: cipher_text, key: key, date: date}
  end

  def decrypt(cipher_text, key, date = todays_date)
    counter = -1
    shifts = shifts(key, date)
    plain_text = cipher_text.chars.map do |char|
      if @char_set.include?(char)
        counter += 1
        shift(char, shifts[counter % 4] * -1)
      else
        char
      end
    end.join
    {decryption: plain_text, key: key, date: date}
  end

  def random_key
    rand(0..99999).to_s.rjust(5, '0')
  end

  def todays_date
    date = Date.today.to_s.split("-")
    "#{date[2]}" + "#{date[1]}" + "#{date[0][2..3]}"
  end

  def shift(char, shift_num)
    index = (@char_set.index(char) + shift_num) % @char_set.length
    @char_set[index]
  end

  def shifts(key, date)
    keys = key.chars.each_cons(2).map { |char_x, char_y| (char_x + char_y).to_i }
    offsets = date.to_i.pow(2).to_s.chars[-4..-1].map { |str| str.to_i }
    [keys, offsets].transpose.map { |key, offset| key + offset }
  end

end
