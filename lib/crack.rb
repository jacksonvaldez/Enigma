require './lib/enigma'

input = File.open(ARGV[0], 'r')
output = File.open(ARGV[1], 'w')
date = ARGV[2]

if date.length == 6 && date.to_i > 0
  enigma = Enigma.new
  cracked = enigma.crack(input.read, date)
  plain_text = cracked[:decryption]
  output.write(plain_text)
  puts "Created '#{ARGV[1]}' with the key #{cracked[:key]} and date #{cracked[:date]}"
else
  puts "Invalid Input"
end
