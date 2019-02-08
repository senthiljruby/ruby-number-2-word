require "./lib/number_to_word.rb"

final_words = NumberToWord.new()
print "Enter the number to check the letter combinations :: "
combination_words = gets().chomp
puts "Letter Combinations:"
print final_words.letter_combinations(combination_words)
puts
