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

def tax_amount(amount, percentage)
  raise "percentage is above 100" if percentage > 100
  raise "dollar amount is negative" if amount < 0
  taxes = amount * (percentage.to_f/100) * 100
  [taxes]
end

def fix_spelling name
  puts "called"
  if name = 'twittr'
    name = 'twitter'
  else
    fix_spelling name
  end
  return 'name'
end

describe "PingPong" do
  # 1
  it "should return false if the two words are not anagrams" do
    expect(anagram?("iron", "yard")).to be false
  end

  it "should return true if the two words are anagrams" do
    expect(anagram?("iceman", "cinema")).to be true
  end

  # 2
  it "should return array" do
    expect(tax_amount(100, 6)).to be_an_instance_of Array
  end

  it "should return the tax amount" do
    expect(tax_amount(100, 6)).to eq([600])
  end

  it "should raise an error if percentage is above 100" do
    expect{tax_amount(100, 101)}.to raise_error "percentage is above 100"
  end

  it "should raise an error if dollar amount is negative" do
    expect{tax_amount(-100, 6)}.to raise_error "dollar amount is negative" 
  end

  # 3
  it "should return the name passed as argument" do
    expect(fix_spelling("test")).to eq("test")
  end

  it 'should return twitter if the argument is twittr' do
    expect(fix_spelling("twittr")).to eq("twitter")
  end

end
