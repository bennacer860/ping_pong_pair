require 'rspec'

describe "PingPong" do
  it "should return false if the two words are not anagrams" do
    expect(anagram?("iron", "yard")).to be_false
  end

  it "should return true if the two words are anagrams" do
    expect(anagram?("iceman", "cinema")).to be_true
  end
end
