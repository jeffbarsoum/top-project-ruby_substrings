
def test_dictionary
  dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
end


def substrings(string, dictionary)
  dictionary.reduce(Hash.new(0)) do |hash, substring|
    hash[substring] += string.downcase.scan(/#{substring}/).length if string.downcase.include? substring.downcase
    hash
  end
end

substrings  "Howdy partner, sit down! How's it going?", test_dictionary
