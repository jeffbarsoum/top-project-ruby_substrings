###############################################################################
## Helper Functions
###############################################################################
def count_pattern string, pattern
  string.downcase.scan(/#{pattern.downcase}/).length
end

def string_includes_pattern? string, pattern
  string.downcase.include? pattern.downcase
end

# A function to pull input from the user
# Can choose to print spacing, or get input, either or both
def get_user_input print_spacing = false, get_input = true

  # an indicator to mark the user's input in the console
  print "--> "

  result = gets.chomp if get_input

  if print_spacing
      print "\n"
      print "###############################################################################\n"
      print "\n"
  end

  # Only return the result if we got user input (get_input == true)
  result if get_input
end

def gets_string
  print "1) Enter the string you want to check for occurences of substrings:\n\n"
  get_user_input true
end

def gets_dictionary
  print "2) Enter each substring you want to check for in the string you just entered.\n"
  print "   Input ':q' when you have entered all of your substrings:\n\n"

  user_dictionary_entry = nil
  dictionary = []

  # ask for input and push it to the dictionary until the ':q' command is entered
  until user_dictionary_entry == ":q" do
    user_dictionary_entry = get_user_input
    dictionary << user_dictionary_entry
  end

  # just printing some spacing
  get_user_input true, false

  # return the dictionary for processing
  dictionary
end


###############################################################################
## Main Function
###############################################################################
def substrings
  # Print a nice intro message
  print "###############################################################################\n"
  print "###################################SubStrings##################################\n"
  print "###############################################################################\n\n"

  # get the user's input for string and dictionary here
  string = gets_string
  dictionary = gets_dictionary

  # we are using reduce to tally counts of each substring, and 'accumulate' a
  # hash with the results
  result = dictionary.reduce Hash.new 0 do |hash, substring|
    if string_includes_pattern? string, substring
      hash[substring] += count_pattern string, substring
    end
    # return the hash
    hash
  end
  # Print to screen, also still return the hash as an object
  print "3) ### Results:\n\n"
  result.each { |key, val| puts "#{key} => #{val}" }
  result
end


###############################################################################
## Call Function
###############################################################################
substrings
