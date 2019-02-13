#!/usr/bin/env ruby

require "./lib/number_to_word.rb"
require "colorize"

final_words = NumberToWord.new()
print "Enter the number to check the letter combinations :: "
combination_words = STDIN.gets().chomp

begin
  print "Letter Combinations:" + final_words.letter_combinations(combination_words).to_s.green
rescue RuntimeError
  print "The number you have entered is not a valid number. Please try again.".red
end
puts
