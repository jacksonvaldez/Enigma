require 'date'


class Enigma

  attr_reader :char_set

  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  def encrypt(plain_text, key, date)
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

  def decrypt(cipher_text, key, date)
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

  end

  def random_date

  end

  def shift(char, shift_num)
    index = (@char_set.index(char) + shift_num) % @char_set.length
    @char_set[index]
  end

  def shifts(key, date)
    shifts = key.chars.each_cons(2).map { |char_x, char_y| (char_x + char_y).to_i }
    shifts_add = date.to_i.pow(2).to_s.chars[-4..-1].map { |e| e.to_i }
    shifts.each_with_index.map do |element, index|
      element + shifts_add[index]
    end
  end

end
