require 'date'


class Enigma

  attr_reader :char_set

  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  def encrypt(plain_text, key, date)

  end

  def decrypt(cipher_text, key, date)

  end

  def random_key

  end

  def random_date

  end

  def shifts(key, date)
    shifts = key.chars.each_cons(2).map { |char_x, char_y| (char_x + char_y).to_i }
    shifts_2 = date.to_i.pow(2).to_s.chars[-4..-1].map { |e| e.to_i }
    shifts.each_with_index.map do |element, index|
      element + shifts_2[index]
    end
  end

end
