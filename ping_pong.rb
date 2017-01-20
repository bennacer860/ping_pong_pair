require 'rspec'
require 'pry'

def anagram?(word_one, word_two)
  word_one_chars = word_one.split('')
  word_two_chars = word_two.split('')

  word_one_chars.sort!
  word_two_chars.sort!

  if word_one_chars == word_two_chars
    true
  else
    false
  end
end

describe "PingPong" do
  it "should return false if the two words are not anagrams" do
    expect(anagram?("iron", "yard")).to be false
  end

  it "should return true if the two words are anagrams" do
    expect(anagram?("iceman", "cinema")).to be true
  end
end
