module Shift # Has any methods about shifting or calculating shifts

  CHARS = ("a".."z").to_a << " "

  def shift_text(text, shifts) # Shifts every valid character in a string and returns the shifted string
    counter = -1
    text.chars.map do |char|
      CHARS.include?(char) ? shift_char(char, shifts[(counter += 1) % 4]) : char
    end.join
  end

  def shift_char(char, shift_num) # shifts a single character by a given amount
    index = (CHARS.index(char) + shift_num) % CHARS.length
    CHARS[index]
  end

  def calc_shifts(key, date) # calculates the A, B, C, D shifts. Ex: [1, 0, 2, 5]
    keys = key.chars.each_cons(2).map { |char_x, char_y| (char_x + char_y).to_i }
    offsets = date.to_i.pow(2).to_s.chars[-4..-1].map { |str| str.to_i }
    [keys, offsets].transpose.map { |key, offset| key + offset }
  end

end
