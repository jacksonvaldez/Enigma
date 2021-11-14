module Shift

  CHARS = ("a".."z").to_a << " "

  def shift_text(text, shifts)
    counter = -1
    text.chars.map do |char|
      CHARS.include?(char) ? shift_char(char, shifts[(counter += 1) % 4]) : char
    end.join
  end

  def shift_char(char, shift_num)
    index = (CHARS.index(char) + shift_num) % CHARS.length
    CHARS[index]
  end

  def calc_shifts(key, date)
    keys = key.chars.each_cons(2).map { |char_x, char_y| (char_x + char_y).to_i }
    offsets = date.to_i.pow(2).to_s.chars[-4..-1].map { |str| str.to_i }
    [keys, offsets].transpose.map { |key, offset| key + offset }
  end

end
