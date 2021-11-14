# Enigma

Project By: Jackson Valdez
Project made in Weeks 5-6 at Turing School of Software & Design


__How To Setup__
1. Clone this repository to your local computer.
2. Make sure you are using the latest version of ruby.
3. Run `gem intsall simplecov` in your terminal.

__How To Use__
1. Run `ruby ./lib/encrypt.rb message.txt encrypted.txt` to encrypt message.txt and write it to encrypted.txt. It will generate a random key and use todays date to encrypt it.
2. Run `ruby ./lib/decrypt.rb encrypted.txt decrypted.txt <key> <date>` to decrypt the message.
3. Run `ruby ./lib/crack.rb encrypted.txt cracked.txt <date>` to crack a message. If the plain text does not end with ' end', it will run in an infinite loop.
4. `<date>` format: DDMMYY
5. `<key>` format: Any 5 digit number (00053, 38563, 09574)

