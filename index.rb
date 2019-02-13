#!/usr/bin/env ruby

require "./lib/number_to_word.rb"

final_words = NumberToWord.new()
print "Enter the number to check the letter combinations :: "
combination_words = STDIN.gets().chomp

begin
  print "Letter Combinations:" + final_words.letter_combinations(combination_words).to_s
rescue RuntimeError
  print "The number you have entered is not a valid number. Please try again."
end
puts
