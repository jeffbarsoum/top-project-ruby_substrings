
def test_dictionary
  dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
end

###############################################################################
## Helper Functions
###############################################################################

def count_pattern string, pattern
  string.downcase.scan(/#{pattern}/).length
end

def string_includes_pattern? string, pattern
  string.downcase.include? pattern.downcase
end


###############################################################################
## Main Function
###############################################################################

def substrings string, dictionary
  dictionary.reduce Hash.new 0 do |hash, substring|
    if string_includes_pattern? string, substring
      hash[substring] += count_pattern string, substring
    end
    hash
  end
end


###############################################################################
## Call Function
###############################################################################

substrings  "Howdy partner, sit down! How's it going?", test_dictionary
