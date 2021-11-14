require 'spec_helper'
require './lib/enigma'


describe Enigma do

  before(:each) do
    @enigma = Enigma.new
  end

  describe '#initialize' do
    it 'has attributes' do
      expect(@enigma.char_set).to eq(("a".."z").to_a << " ")
    end
  end

  describe '#encrypt' do
    it 'returns a hash with cipher text, key, and date' do
      expected = {
        encryption: "keder ohulw!tlmsvrb",
        key: "02715",
        date: "040895"
      }
      expect(@enigma.encrypt("hello world! im bob", "02715", "040895")).to eq(expected)
    end
  end

  describe '#decrypt' do
    it 'returns a hash with plain text, key, and date' do
      expected = {
        decryption: "hello world! im bob",
        key: "02715",
        date: "040895"
      }
      expect(@enigma.decrypt("keder ohulw!tlmsvrb", "02715", "040895")).to eq(expected)
    end
  end

  describe '#shift_text' do
    it 'shifts a string using given shifts' do
      expect(@enigma.shift_text("hello world!", [1, 2, 3, 4])).to eq("igoppbzssng!")
    end
  end

  describe '#shift_char' do
    it 'shifts a single char by given amount' do
      expect(@enigma.shift_char("z", 5)).to eq("d")
    end
  end

  describe '#shifts' do
    it 'returns an array of the shifts from given ket and date' do
      expect(@enigma.shifts("02715", "040895")).to eq([3, 27, 73, 20])
    end
  end

  describe '#random_key' do
    it 'returns a random key' do
      expect(@enigma.random_key.length).to eq(5)
      expect(@enigma.random_key.to_i > 0).to eq(true)
    end
  end

  describe '#todays_date' do
    it 'returns todays date' do
      expect(@enigma.todays_date.length).to eq(6)
      expect(@enigma.todays_date.to_i > 0).to eq(true)
    end
  end

end
