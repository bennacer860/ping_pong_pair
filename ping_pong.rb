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
  if name == 'twittr'
    name = 'twitter'
  end
  return name
end

def convert_volume measure1, measure2, measure3
  raise "negative value argument" if (measure1 < 0 || measure2 < 0 || measure3 < 0)
  raise "0 value argument" if (measure1 == 0 || measure2 == 0 || measure3 == 0)
  (measure1*0.01) * (measure2*0.01) * (measure3*0.01) * 1000 

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

  it 'should return correct liter value' do
    expect(convert_volume(100, 100, 100)).to eq(1000)
  end

  it 'should throw error if 0 value argument' do
    expect{convert_volume(0, 100, 100)}.to raise_error "0 value argument"
    expect{convert_volume(100, 0, 100)}.to raise_error "0 value argument"
    expect{convert_volume(100, 100, 0)}.to raise_error "0 value argument"
  end

  it 'should throw error if negative value argument' do
    expect{convert_volume(-1, 100, 100)}.to raise_error "negative value argument"
    expect{convert_volume(100, -1, 100)}.to raise_error "negative value argument"
    expect{convert_volume(100, 100, -1)}.to raise_error "negative value argument"
  end
end
