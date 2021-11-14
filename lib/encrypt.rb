require './lib/enigma'

input = File.open(ARGV[0], 'r')
output = File.open(ARGV[1], 'w')

enigma = Enigma.new
encryption = enigma.encrypt(input.read, "02715", "040895")
cipher_text = encryption[:encryption]
output.write(cipher_text)


puts "Created '#{ARGV[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"
