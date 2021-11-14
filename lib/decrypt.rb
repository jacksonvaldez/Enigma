require './lib/enigma'

input = File.open(ARGV[0], 'r')
output = File.open(ARGV[1], 'w')
key = ARGV[2]
date = ARGV[3]

if key.length == 5 && key.to_i > 0 && date.length == 6 && date.to_i > 0
  enigma = Enigma.new
  decryption = enigma.decrypt(input.read, key, date)
  plain_text = decryption[:decryption]
  output.write(plain_text)
  puts "Created '#{ARGV[1]}' with the key #{decryption[:key]} and date #{decryption[:date]}"
else
  puts "Invalid Input"
end
