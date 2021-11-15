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



__Self Assessment__
1. Functionality (4): The program completes all of Iteration 4.
2. Object Oriented Programming(3): Program uses a module, but it could have used a better class/module structure from the beginning.
3. Ruby Conventions and Mechanics(4): All methods are named very well and anyone reading the code could understand what their purpose is. Syntax and indenting is consistent. The maximum lines of code for a single method was 6. The entire program is only 35 lines of code according to SimpleCov.
4. Test Driven Development(3): All tests were written before the code. Edge cases are addressed for any components of the program that are interacted with by a user (CLI). SimpleCov results are 100% coverage. But there could have been more tests for smaller functionalities and mocks/stubs were not used.
5. **Overall Score:** 3.5
