require 'date'


class Enigma

  attr_reader :char_set

  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  def encrypt(plain_text, key, date)
    counter = 0
    plain_text.chars.map do |char|
      if @char_set.include?(char)
        counter > 3 ? counter = 0 : counter += 1
        self.shift(char, self.shifts[counter % 4])
      else
        char
      end
    end
  end

  def decrypt(cipher_text, key, date)

  end

  def random_key

  end

  def random_date

  end

  def shift(char, shift_num)

  end

  def shifts(key, date)
    shifts = key.chars.each_cons(2).map { |char_x, char_y| (char_x + char_y).to_i }
    shifts_add = date.to_i.pow(2).to_s.chars[-4..-1].map { |e| e.to_i }
    shifts.each_with_index.map do |element, index|
      element + shifts_add[index]
    end
  end

end
