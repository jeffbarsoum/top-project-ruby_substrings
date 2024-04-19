
def test_dictionary
  dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
end


def substrings(string, dictionary)
  dictionary.reduce(Hash.new(0)) do |hash, substring|
    hash[substring] += 1 if string.include? substring
    hash
  end
end

substrings 'below', test_dictionary
